import 'package:maki_mobile/features/pos/domain/edc.dart';

/// A machine that isn't connected to the till, the spec's first step: the
/// cashier keys the amount into it, and types in the number on its slip.
class ManualEdcTerminal implements EdcTerminal {
  const ManualEdcTerminal();

  @override
  Future<EdcResult> charge(EdcRequest request) async =>
      const EdcByHandResult(EdcByHand.manual);
}
