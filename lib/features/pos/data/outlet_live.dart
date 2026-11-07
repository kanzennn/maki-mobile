import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// What a message may say changed.
abstract final class LiveTopic {
  static const catalog = 'catalog';
  static const tables = 'tables';
  static const orders = 'orders';
  static const Set<String> all = {catalog, tables, orders};
}

/// Follows the outlet's live messages, saying only what changed, for as long
/// as it is started, connecting again whenever the connection ends, each time
/// with a new ticket. After connecting again [onChange] hears everything, as
/// messages may have gone unheard. No connection is no harm: the catalog and
/// the tables still load on their own schedule, just not at once.
class OutletLive {
  OutletLive({
    required this.socketUri,
    required this.onChange,
    Future<WebSocket> Function(Uri uri)? connect,
    this.firstRetry = const Duration(seconds: 1),
    this.maxRetry = const Duration(seconds: 30),
  }) : _connect = connect ?? ((uri) => WebSocket.connect(uri.toString()));

  /// The server's way to say a connection ended on purpose, as each does
  /// after a while: connect again at once.
  static const closeRenew = 4000;

  /// Asks for a ticket, and gives the address to connect to with it.
  final Future<Uri> Function() socketUri;
  final void Function(Set<String> topics) onChange;
  final Future<WebSocket> Function(Uri uri) _connect;
  final Duration firstRetry;
  final Duration maxRetry;

  /// Each start counts as a new run; whatever an older one was waiting for
  /// finds it isn't current any more, and stops.
  int _run = 0;
  bool _started = false;
  bool _heardBefore = false;
  late Duration _retry = firstRetry;
  WebSocket? _socket;
  Timer? _timer;

  /// Connects, unless it already follows.
  void start() {
    if (_started) return;
    _started = true;
    _retry = firstRetry;
    unawaited(_open(++_run));
  }

  /// Stops following: in the background, or for good.
  void stop() {
    _started = false;
    _run++;
    _timer?.cancel();
    _timer = null;
    final socket = _socket;
    _socket = null;
    if (socket != null) unawaited(socket.close());
  }

  Future<void> _open(int run) async {
    final WebSocket socket;
    try {
      final uri = await socketUri();
      if (run != _run) return;
      socket = await _connect(uri);
    } on Object {
      // The ticket or the connection failed: both pass, or the session ends.
      _later(run);
      return;
    }
    if (run != _run) {
      unawaited(socket.close());
      return;
    }
    _socket = socket;
    _retry = firstRetry;
    if (_heardBefore) onChange(LiveTopic.all);
    _heardBefore = true;
    socket.listen(
      _heard,
      onDone: () {
        if (run != _run) return;
        _socket = null;
        if (socket.closeCode == closeRenew) {
          unawaited(_open(run));
        } else {
          _later(run);
        }
      },
      onError: (Object _) {}, // onDone follows, and tries again
      cancelOnError: false,
    );
  }

  void _heard(dynamic message) {
    if (message is! String) return;
    final Object? decoded;
    try {
      decoded = jsonDecode(message);
    } on FormatException {
      return;
    }
    if (decoded case {'topics': final List<dynamic> topics}) {
      onChange(topics.whereType<String>().toSet());
    }
  }

  void _later(int run) {
    if (run != _run) return;
    final wait = _retry;
    final doubled = wait * 2;
    _retry = doubled > maxRetry ? maxRetry : doubled;
    _timer = Timer(wait, () => unawaited(_open(run)));
  }
}
