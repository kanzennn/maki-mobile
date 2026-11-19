/// What a machine is asked to charge: the sale's receipt number, and its
/// total in whole rupiah.
typedef EdcRequest = ({String orderNo, int amount});

/// Why a machine didn't take the money: the cashier may charge again.
enum EdcNotCharged { declined, cancelled, unreachable }

/// Why the cashier reads the slip: the machine isn't connected to the till, or
/// it was asked and never answered, so the money may have moved.
enum EdcByHand { manual, noAnswer }

/// A machine's answer. Anything that may have moved money is never
/// [EdcNotChargedResult].
sealed class EdcResult {
  const EdcResult();
}

final class EdcApproved extends EdcResult {
  const EdcApproved(this.reference);
  final String reference;
}

final class EdcByHandResult extends EdcResult {
  const EdcByHandResult(this.reason);
  final EdcByHand reason;
}

final class EdcNotChargedResult extends EdcResult {
  const EdcNotChargedResult(this.reason);
  final EdcNotCharged reason;
}

/// An EDC machine, as the till talks to it. Each bank's or vendor's machine is
/// a driver of this. A driver never sees a card's number: it hands over the
/// amount, and takes back the slip's.
abstract interface class EdcTerminal {
  Future<EdcResult> charge(EdcRequest request);
}

/// The server's rules for a slip's number, by the names it gives them.
enum ReferenceProblem { required, format, cardNumber }

final _reference = RegExp(r'^[A-Z0-9][A-Z0-9-]{2,30}[A-Z0-9]$');
final _cardNumber = RegExp(r'^[0-9]{13,19}$');

/// A slip's number as the server keeps it, or the rule it breaks, as the server
/// checks it. A card's number is refused by its name: it must not leave the
/// till, and a cashier reading the wrong line of a slip could type one in.
({String? reference, ReferenceProblem? problem}) checkReference(String typed) {
  final reference = typed.trim().toUpperCase();
  if (reference.isEmpty) {
    return (reference: null, problem: ReferenceProblem.required);
  }
  if (_cardNumber.hasMatch(reference.replaceAll('-', ''))) {
    return (reference: null, problem: ReferenceProblem.cardNumber);
  }
  if (!_reference.hasMatch(reference)) {
    return (reference: null, problem: ReferenceProblem.format);
  }
  return (reference: reference, problem: null);
}
