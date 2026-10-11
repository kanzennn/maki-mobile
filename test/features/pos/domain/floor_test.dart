import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';

import '../../../helpers/pos.dart';

void main() {
  test('a table is sold at while available or occupied, not while off', () {
    FloorTable table(TableStatus status) => FloorTable(
      tableId: 't-a1',
      name: 'A1',
      shape: TableShape.square,
      status: status,
    );
    expect(table(TableStatus.available).selectable, isTrue);
    // An order more there is a sale of its own.
    expect(table(TableStatus.occupied).selectable, isTrue);
    expect(table(TableStatus.inactive).selectable, isFalse);
    expect(table(TableStatus.scheduled).selectable, isFalse);
  });

  test('finds a table and its area, and knows an outlet without any', () {
    final floor = testFloor();
    expect(floor.hasTables, isTrue);
    expect(floor.find('t-t2')?.area.name, 'Teras');
    expect(floor.find('t-a2')?.table.seated?.orders, 2);
    expect(floor.find('gone'), isNull);
    expect(const Floor(areas: []).hasTables, isFalse);
  });
}
