import 'dart:math';

const _letters = 'abcdefghijklmnopqrstuvwxyz';
const _alphabet = '${_letters}0123456789';

/// An order's ID, made here as the backend makes its own: the shape of a
/// CUID2, a lowercase letter then lowercase letters and digits, 24 in all,
/// from the platform's cryptographic random numbers. 23 random characters of
/// 36 leave a collision out of reach. The ID is the order's idempotency key,
/// so an order keeps it for every resend.
String newOrderId([Random? random]) {
  final source = random ?? Random.secure();
  final id = StringBuffer(_letters[source.nextInt(_letters.length)]);
  while (id.length < 24) {
    id.write(_alphabet[source.nextInt(_alphabet.length)]);
  }
  return id.toString();
}
