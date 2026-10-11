import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor.freezed.dart';

/// An area's grid, in cells: the server's canvas, the same in every area.
const floorColumns = 48;
const floorRows = 32;

/// A table's status, as the server reads it now, in this order: customers
/// seated since the table was last released (occupied), turned off by the
/// Manager (inactive), out on a schedule (scheduled), or free (available).
enum TableStatus { available, occupied, inactive, scheduled }

enum TableShape { square, round, rectangle }

enum DecorationKind { wall, cashier, door }

/// A box on the grid, in cells from its top left.
@freezed
abstract class GridBox with _$GridBox {
  const factory GridBox({
    required int x,
    required int y,
    required int w,
    required int h,
  }) = _GridBox;
}

/// Who is seated at a table: since the sale that seated them, and how many
/// sales the table has had since.
@freezed
abstract class Seated with _$Seated {
  const factory Seated({required DateTime since, required int orders}) =
      _Seated;
}

/// A table as the cashier sees it (`GET /pos/tables`).
@freezed
abstract class FloorTable with _$FloorTable {
  const factory FloorTable({
    required String tableId,
    required String name,
    required TableShape shape,
    required TableStatus status,

    /// Seats; null when not given.
    int? capacity,

    /// Its place on its area's layout; null while it isn't placed.
    GridBox? box,

    /// While customers are seated there.
    Seated? seated,
  }) = _FloorTable;

  const FloorTable._();

  /// Whether the cashier can sell at it: available, or occupied, where an
  /// order more is a sale of its own.
  bool get selectable =>
      status == TableStatus.available || status == TableStatus.occupied;
}

/// A marker on a layout — a wall, the cashier, a door — that isn't a table.
@freezed
abstract class FloorDecoration with _$FloorDecoration {
  const factory FloorDecoration({
    required DecorationKind kind,
    required GridBox box,
  }) = _FloorDecoration;
}

/// One of the outlet's areas that holds tables, with its layout.
@freezed
abstract class FloorArea with _$FloorArea {
  const factory FloorArea({
    required String areaId,
    required String name,
    required List<FloorDecoration> decorations,

    /// By name, placed or not.
    required List<FloorTable> tables,
  }) = _FloorArea;
}

/// The outlet's tables, area by area in the cashier's order: only the areas
/// that hold tables.
@freezed
abstract class Floor with _$Floor {
  const factory Floor({required List<FloorArea> areas}) = _Floor;

  const Floor._();

  /// Whether the outlet has tables to pick from at all.
  bool get hasTables => areas.isNotEmpty;

  /// The table, and the area it is in, by its ID; null when it isn't on the
  /// floor any more.
  ({FloorArea area, FloorTable table})? find(String tableId) {
    for (final area in areas) {
      for (final table in area.tables) {
        if (table.tableId == tableId) return (area: area, table: table);
      }
    }
    return null;
  }
}

/// The table an order is for, by its name when it was picked: the receipt
/// has the name as the server saved it.
@freezed
abstract class OrderTable with _$OrderTable {
  const factory OrderTable({required String tableId, required String name}) =
      _OrderTable;
}
