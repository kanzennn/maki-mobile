import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Fails when a message exists in one language but not in another, so a
/// missing translation breaks CI instead of reaching users.
void main() {
  test('every ARB file has the same messages', () {
    final files = Directory('lib/l10n')
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.arb'))
        .toList();
    expect(files, hasLength(greaterThanOrEqualTo(2)));

    final keysByFile = {
      for (final file in files)
        file.uri.pathSegments.last:
            (jsonDecode(file.readAsStringSync()) as Map<String, dynamic>).keys
                .where((key) => !key.startsWith('@'))
                .toSet(),
    };
    final allKeys = keysByFile.values.expand((keys) => keys).toSet();

    final missing = [
      for (final MapEntry(key: file, value: keys) in keysByFile.entries)
        for (final key in allKeys.difference(keys)) '$file is missing $key',
    ];
    expect(missing, isEmpty);
  });
}
