import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/features/pos/data/outlet_live.dart';

/// A real WebSocket server on a free local port, standing in for the backend.
class _Server {
  late HttpServer _http;
  final sockets = <WebSocket>[];
  final _connected = StreamController<WebSocket>.broadcast();

  Future<void> start() async {
    _http = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    _http.listen((request) async {
      final socket = await WebSocketTransformer.upgrade(request);
      sockets.add(socket);
      _connected.add(socket);
      // Answers a client's close, as a real server does.
      socket.listen((_) {}, onDone: socket.close);
    });
  }

  Uri get uri => Uri.parse('ws://127.0.0.1:${_http.port}/live?ticket=t');

  /// The next socket to connect, however soon.
  Future<WebSocket> next() => _connected.stream.first.timeout(_patience);

  Future<void> close() async {
    for (final socket in sockets) {
      await socket.close();
    }
    await _http.close(force: true);
    await _connected.close();
  }
}

const _patience = Duration(seconds: 5);
const _shortly = Duration(milliseconds: 150);

void main() {
  late _Server server;
  late List<Set<String>> heard;
  late int tickets;
  late OutletLive live;

  setUp(() async {
    server = _Server();
    await server.start();
    heard = [];
    tickets = 0;
    live = OutletLive(
      socketUri: () async {
        tickets++;
        return server.uri;
      },
      onChange: heard.add,
      firstRetry: const Duration(milliseconds: 10),
      maxRetry: const Duration(milliseconds: 20),
    );
  });

  tearDown(() async {
    live.stop();
    await server.close();
  });

  Future<WebSocket> connected() {
    final next = server.next();
    live.start();
    return next;
  }

  Future<void> until(bool Function() done) async {
    final deadline = DateTime.now().add(_patience);
    while (!done() && DateTime.now().isBefore(deadline)) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }
    expect(done(), isTrue);
  }

  test('says what a message says changed, and nothing on connecting', () async {
    final socket = await connected();
    await Future<void>.delayed(_shortly);
    expect(heard, isEmpty);

    socket.add(
      jsonEncode({
        'topics': ['catalog', 'tables'],
      }),
    );
    await until(() => heard.isNotEmpty);
    expect(heard.single, {'catalog', 'tables'});
  });

  test('ignores what it cannot read', () async {
    final socket = await connected();
    socket
      ..add('not json')
      ..add(jsonEncode({'other': 1}))
      ..add(
        jsonEncode({
          'topics': ['orders'],
        }),
      );
    await until(() => heard.isNotEmpty);
    expect(heard.single, {'orders'});
  });

  test('connects again with a new ticket, and hears everything', () async {
    final first = await connected();
    final second = server.next();
    await first.close();
    await second;
    await until(() => heard.isNotEmpty);
    expect(heard.single, LiveTopic.all);
    expect(tickets, 2);
  });

  test('connects again when the server renews the connection', () async {
    final first = await connected();
    final second = server.next();
    await first.close(OutletLive.closeRenew);
    await second;
    expect(tickets, 2);
  });

  test('tries again when a ticket fails', () async {
    var failures = 2;
    final next = server.next();
    live = OutletLive(
      socketUri: () async {
        if (failures-- > 0) throw StateError('no ticket');
        return server.uri;
      },
      onChange: heard.add,
      firstRetry: const Duration(milliseconds: 5),
      maxRetry: const Duration(milliseconds: 10),
    )..start();
    await next;
    expect(failures, -1);
  });

  test('stays away once stopped, and comes back when started', () async {
    final socket = await connected();
    final closed = socket.done;
    live.stop();
    await closed.timeout(_patience);
    final count = tickets;
    await Future<void>.delayed(_shortly);
    expect(tickets, count);

    final next = server.next();
    live.start();
    await next;
    expect(tickets, count + 1);
  });

  test('a second start does not connect twice', () async {
    await connected();
    live.start();
    await Future<void>.delayed(_shortly);
    expect(tickets, 1);
  });
}
