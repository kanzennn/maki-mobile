import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';

part 'catalog_cubit.freezed.dart';

@freezed
sealed class CatalogState with _$CatalogState {
  const factory CatalogState.loading() = CatalogLoading;
  const factory CatalogState.ready(Catalog catalog) = CatalogReady;
  const factory CatalogState.failed(ApiException error) = CatalogFailed;
}

/// What the cashier sells from. Its stock is as it was when loaded, so it
/// loads again after each sale and void, every [refreshEvery] while the app
/// is in front, and when the app comes back to it; the server decides each
/// sale against the stock as it is.
class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit(this._pos, {this.refreshEvery = const Duration(seconds: 30)})
    : super(const CatalogState.loading());

  final PosRepository _pos;
  final Duration refreshEvery;
  Timer? _timer;
  Future<void>? _loading;

  /// Loads the catalog, and keeps loading it again.
  Future<void> start() {
    _schedule();
    return refresh();
  }

  /// Loads the catalog again; loads that overlap share one request. A
  /// failure keeps the catalog in hand, if there is one.
  Future<void> refresh() =>
      _loading ??= _load().whenComplete(() => _loading = null);

  /// Tries again after the catalog couldn't load at all.
  Future<void> retry() {
    if (state is CatalogReady) return refresh();
    emit(const CatalogState.loading());
    return refresh();
  }

  /// The app went to the background: no loading until it is back.
  void paused() {
    _timer?.cancel();
    _timer = null;
  }

  /// The app is back in front: the stock may have moved meanwhile.
  Future<void> resumed() => start();

  Future<void> _load() async {
    try {
      final catalog = await _pos.catalog();
      if (!isClosed) emit(CatalogState.ready(catalog));
    } on ApiException catch (error) {
      if (!isClosed && state is! CatalogReady) {
        emit(CatalogState.failed(error));
      }
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
