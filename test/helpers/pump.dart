import 'package:flutter_test/flutter_test.dart';

/// Pumps until [finder] finds something, then lets the screen settle, so a
/// test waits for the outcome rather than for a guessed amount of time.
///
/// It moves the test's fake clock as it goes: Dio starts every request with
/// a zero-length timer, which fires only when that clock moves, so a bare
/// pump() would wait forever.
Future<void> pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 5),
}) async {
  const step = Duration(milliseconds: 16);
  for (var waited = Duration.zero; finder.evaluate().isEmpty; waited += step) {
    if (waited >= timeout) {
      throw TestFailure('Nothing after $timeout of fake time: $finder');
    }
    await tester.pump(step);
  }
  await tester.pumpAndSettle();
}

/// Pumps until [condition] holds, then lets the screen settle: for a state
/// with no widget of its own to find, such as a button turning on.
Future<void> pumpUntil(
  WidgetTester tester,
  bool Function() condition, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  const step = Duration(milliseconds: 16);
  for (var waited = Duration.zero; !condition(); waited += step) {
    if (waited >= timeout) {
      throw TestFailure('Still not so after $timeout of fake time');
    }
    await tester.pump(step);
  }
  await tester.pumpAndSettle();
}
