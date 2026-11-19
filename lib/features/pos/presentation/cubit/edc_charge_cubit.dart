import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/features/pos/domain/edc.dart';

/// Where a sale's charge is.
sealed class EdcChargeState {
  const EdcChargeState();
}

final class EdcIdle extends EdcChargeState {
  const EdcIdle();
}

final class EdcCharging extends EdcChargeState {
  const EdcCharging();
}

final class EdcAwaitingSlip extends EdcChargeState {
  const EdcAwaitingSlip(this.reason);
  final EdcByHand reason;
}

final class EdcFailed extends EdcChargeState {
  const EdcFailed(this.reason);
  final EdcNotCharged reason;
}

final class EdcPaid extends EdcChargeState {
  const EdcPaid(this.reference);
  final String reference;
}

/// One sale's charge on a machine. Its rule is that a customer pays once: the
/// machine is asked again only after it said the money didn't move. A machine
/// that doesn't answer, or fails, may have taken it, so the cashier reads the
/// slip instead. Once paid, the order keeps the reference for its resends,
/// which never reach the machine.
class EdcChargeCubit extends Cubit<EdcChargeState> {
  EdcChargeCubit(this._terminal) : super(const EdcIdle());

  final EdcTerminal _terminal;

  /// Asks the machine, when it may be asked. Anything else changes nothing.
  Future<void> charge(EdcRequest request) async {
    if (state is! EdcIdle && state is! EdcFailed) return;
    emit(const EdcCharging());
    final settled = _settled(await _answer(request));
    if (!isClosed) emit(settled);
  }

  /// The number the cashier read off the slip: null when it pays the sale, or
  /// the rule it breaks.
  ReferenceProblem? enter(String typed) {
    if (state is! EdcAwaitingSlip) return null;
    final checked = checkReference(typed);
    final reference = checked.reference;
    if (reference != null) emit(EdcPaid(reference));
    return checked.problem;
  }

  Future<EdcResult> _answer(EdcRequest request) async {
    try {
      return await _terminal.charge(request);
    } on Object {
      return const EdcByHandResult(EdcByHand.noAnswer);
    }
  }

  EdcChargeState _settled(EdcResult result) => switch (result) {
    // Approved, so the money moved: a number the server wouldn't take is the
    // cashier's to read.
    EdcApproved(:final reference) => switch (checkReference(reference)) {
      (reference: final String kept, problem: _) => EdcPaid(kept),
      _ => const EdcAwaitingSlip(EdcByHand.noAnswer),
    },
    EdcByHandResult(:final reason) => EdcAwaitingSlip(reason),
    EdcNotChargedResult(:final reason) => EdcFailed(reason),
  };
}
