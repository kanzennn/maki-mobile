import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/core/printing/esc_pos.dart';
import 'package:maki_mobile/features/pos/data/receipt_printer.dart';

class PrinterState {
  const PrinterState({
    this.settings = const PrinterSettings(),
    this.paired = const [],
    this.listing = false,
    this.listProblem,
    this.printing = false,
  });

  final PrinterSettings settings;

  /// What Android has paired, as last asked.
  final List<PairedPrinter> paired;
  final bool listing;
  final PrinterProblem? listProblem;
  final bool printing;

  PrinterState _with({
    PrinterSettings? settings,
    List<PairedPrinter>? paired,
    bool? listing,
    PrinterProblem? listProblem,
    bool? printing,
  }) => PrinterState(
    settings: settings ?? this.settings,
    paired: paired ?? this.paired,
    listing: listing ?? this.listing,
    listProblem: listProblem,
    printing: printing ?? this.printing,
  );
}

/// The phone's receipt printer: its settings, the printers Android has
/// paired, and one ticket at a time on its way. A ticket that doesn't print
/// changes nothing about its sale, so printing answers with the problem, for
/// the screen to say, rather than failing.
class PrinterCubit extends Cubit<PrinterState> {
  PrinterCubit(this._bridge, this._storage) : super(const PrinterState());

  final PrinterBridge _bridge;
  final PrinterSettingsStorage _storage;

  Future<void> load() async {
    final settings = await _storage.read();
    if (!isClosed) emit(state._with(settings: settings));
  }

  /// Asks Android again, for a printer paired just now.
  Future<void> listPaired() async {
    emit(state._with(listing: true));
    try {
      final paired = await _bridge.paired();
      if (!isClosed) emit(state._with(paired: paired, listing: false));
    } on PrinterException catch (error) {
      if (!isClosed) {
        emit(
          state._with(paired: [], listing: false, listProblem: error.problem),
        );
      }
    }
  }

  Future<void> choose(PairedPrinter printer) => _save(
    PrinterSettings(
      printer: printer,
      paper: state.settings.paper,
      auto: state.settings.auto,
    ),
  );

  Future<void> setPaper(PaperWidth paper) => _save(
    PrinterSettings(
      printer: state.settings.printer,
      paper: paper,
      auto: state.settings.auto,
    ),
  );

  Future<void> setAuto({required bool auto}) => _save(
    PrinterSettings(
      printer: state.settings.printer,
      paper: state.settings.paper,
      auto: auto,
    ),
  );

  /// Sends [ticket], made for the phone's roll, to its printer: null when it
  /// went, or what stopped it. While one is on its way another is ignored.
  Future<PrinterProblem?> print(
    Uint8List Function(PaperWidth paper) ticket,
  ) async {
    final printer = state.settings.printer;
    if (printer == null) return PrinterProblem.noPrinter;
    if (state.printing) return null;
    emit(state._with(printing: true, listProblem: state.listProblem));
    try {
      await _bridge.send(printer.address, ticket(state.settings.paper));
      return null;
    } on PrinterException catch (error) {
      return error.problem;
    } finally {
      if (!isClosed) {
        emit(state._with(printing: false, listProblem: state.listProblem));
      }
    }
  }

  Future<void> _save(PrinterSettings settings) async {
    emit(state._with(settings: settings, listProblem: state.listProblem));
    await _storage.write(settings);
  }
}
