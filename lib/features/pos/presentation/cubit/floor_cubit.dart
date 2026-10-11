import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';

part 'floor_cubit.freezed.dart';

@freezed
sealed class FloorState with _$FloorState {
  const factory FloorState.loading() = FloorLoading;
  const factory FloorState.ready(Floor floor) = FloorReady;
  const factory FloorState.failed(ApiException error) = FloorFailed;
}

/// The outlet's tables at the cashier, with their statuses. A status changes
/// with every sale, so the floor loads again whenever it is shown, after a
/// sale, a void or a release, every [refreshEvery] while the app is in
/// front, and when the app comes back to it.
class FloorCubit extends Cubit<FloorState> {
  FloorCubit(this._pos, {this.refreshEvery = const Duration(seconds: 30)})
    : super(const FloorState.loading());

  final PosRepository _pos;
  final Duration refreshEvery;
  Timer? _timer;
  Future<void>? _loading;

  /// Whether the outlet has tables to pick from: none while the floor
  /// hasn't loaded.
  bool get hasTables => switch (state) {
    FloorReady(:final floor) => floor.hasTables,
    _ => false,
  };

  /// Loads the floor, and keeps loading it again.
  Future<void> start() {
    _schedule();
    return refresh();
  }

  /// Loads the floor again; loads that overlap share one request. A failure
  /// keeps the floor in hand, if there is one.
  Future<void> refresh() =>
      _loading ??= _load().whenComplete(() => _loading = null);

  /// Tries again after the floor couldn't load at all.
  Future<void> retry() {
    if (state is FloorReady) return refresh();
    emit(const FloorState.loading());
    return refresh();
  }

  /// Customers have left [tableId]: it's free again, and the floor loads
  /// again to show it. The refusal, if any, is thrown for the screen to say.
  Future<void> release(String tableId) async {
    await _pos.releaseTable(tableId);
    if (!isClosed) await refresh();
  }

  /// The app went to the background: no loading until it is back.
  void paused() {
    _timer?.cancel();
    _timer = null;
  }

  /// The app is back in front: sales may have seated customers meanwhile.
  Future<void> resumed() => start();

  Future<void> _load() async {
    try {
      final floor = await _pos.floor();
      if (!isClosed) emit(FloorState.ready(floor));
    } on ApiException catch (error) {
      if (!isClosed && state is! FloorReady) emit(FloorState.failed(error));
    }
  }

  void _schedule() {
    _timer?.cancel();
    _timer = Timer.periodic(refreshEvery, (_) => unawaited(refresh()));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
