import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/presentation/pos_text.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The outlet's floor at the cashier, an area at a time: a chip per area,
/// the key, the area's layout with each table's status, and the tables not
/// placed on it. Each table [canPick] allows is a button; [picked] shows
/// strongly, and its area is the one shown first.
class FloorPanel extends StatefulWidget {
  const FloorPanel({
    required this.floor,
    required this.onPick,
    super.key,
    this.canPick,
    this.picked,
    this.fill = false,
  });

  final Floor floor;
  final ValueChanged<FloorTable> onPick;

  /// Which tables are buttons; all of them when null.
  final bool Function(FloorTable table)? canPick;
  final String? picked;

  /// Whether the panel fills the height it is given, the layout taking what
  /// the rest leaves: a tablet's floor shows whole at once. Otherwise, in a
  /// list, it is as tall as its parts.
  final bool fill;

  @override
  State<FloorPanel> createState() => _FloorPanelState();
}

class _FloorPanelState extends State<FloorPanel> {
  String? _areaId;

  @override
  void initState() {
    super.initState();
    final picked = widget.picked;
    _areaId = picked == null ? null : widget.floor.find(picked)?.area.areaId;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final areas = widget.floor.areas;
    final area =
        areas.where((a) => a.areaId == _areaId).firstOrNull ??
        areas.firstOrNull;
    if (area == null) return const SizedBox.shrink();
    final unplaced = [
      for (final table in area.tables)
        if (table.box == null) table,
    ];
    final canPick = widget.canPick ?? (_) => true;
    final layout = FloorLayout(
      area: area,
      onPick: widget.onPick,
      canPick: canPick,
      picked: widget.picked,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: widget.fill ? MainAxisSize.max : MainAxisSize.min,
      children: [
        if (areas.length > 1) ...[
          Wrap(
            spacing: MakiSpacing.sm,
            runSpacing: MakiSpacing.sm,
            children: [
              for (final a in areas)
                ChoiceChip(
                  label: Text(a.name),
                  selected: a.areaId == area.areaId,
                  onSelected: (_) => setState(() => _areaId = a.areaId),
                ),
            ],
          ),
          const SizedBox(height: MakiSpacing.md),
        ],
        const TableLegend(),
        const SizedBox(height: MakiSpacing.md),
        if (widget.fill) Expanded(child: layout) else layout,
        if (unplaced.isNotEmpty) ...[
          const SizedBox(height: MakiSpacing.md),
          Text(
            l10n.tableUnplaced,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: MakiSpacing.sm),
          Wrap(
            spacing: MakiSpacing.sm,
            runSpacing: MakiSpacing.sm,
            children: [
              for (final table in unplaced)
                _UnplacedTable(
                  table: table,
                  picked: table.tableId == widget.picked,
                  onPressed: canPick(table) ? () => widget.onPick(table) : null,
                ),
            ],
          ),
        ],
      ],
    );
  }
}

/// An area's layout: its grid, its decorations, and its placed tables in
/// their shapes with their statuses.
///
/// In a list (a phone's screen) it is as wide as the list. Given a height
/// to fill (a tablet's), it shows whole at once, as large as fits there,
/// down to a cell [minFitCell] wide. Where it can't, a cell stays [minCell]
/// wide, so a table is a finger's target, and the layout pans and
/// pinch-zooms (DESIGN.md: "Table layout: read-only, with pan and
/// pinch-to-zoom").
class FloorLayout extends StatelessWidget {
  const FloorLayout({
    required this.area,
    required this.onPick,
    required this.canPick,
    super.key,
    this.picked,
  });

  /// A cell's least width, in logical pixels: three of them are 48dp.
  static const minCell = 16.0;

  /// A cell's least width where the whole layout shows at once, filling a
  /// tablet's screen: an overview, its three-cell tables 36dp at least.
  static const minFitCell = 12.0;

  final FloorArea area;
  final ValueChanged<FloorTable> onPick;
  final bool Function(FloorTable table) canPick;
  final String? picked;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final fill = constraints.hasBoundedHeight;
        final fit = fill
            ? math.min(
                constraints.maxWidth / floorColumns,
                constraints.maxHeight / floorRows,
              )
            : constraints.maxWidth / floorColumns;
        final whole = fit >= (fill ? minFitCell : minCell);
        final cell = whole ? fit : minCell;
        final canvas = SizedBox(
          width: cell * floorColumns,
          height: cell * floorRows,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _GridPainter(
                    cell: cell,
                    decorations: area.decorations,
                    background: theme.colorScheme.surfaceContainerLow,
                    line: theme.colorScheme.outline,
                    wall: context.tokens.iconMuted,
                    mark: theme.colorScheme.surfaceContainer,
                  ),
                ),
              ),
              for (final decoration in area.decorations)
                if (decoration.kind != DecorationKind.wall &&
                    decoration.box.w >= 2)
                  Positioned(
                    left: decoration.box.x * cell,
                    top: decoration.box.y * cell,
                    width: decoration.box.w * cell,
                    height: decoration.box.h * cell,
                    child: ExcludeSemantics(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            decorationLabel(l10n, decoration.kind),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              for (final table in area.tables)
                if (table.box case final box?)
                  Positioned(
                    left: box.x * cell,
                    top: box.y * cell,
                    width: box.w * cell,
                    height: box.h * cell,
                    child: Padding(
                      padding: EdgeInsets.all(cell * 0.15),
                      child: TableMark(
                        table: table,
                        selected: table.tableId == picked,
                        onTap: canPick(table) ? () => onPick(table) : null,
                      ),
                    ),
                  ),
            ],
          ),
        );
        final framed = Semantics(
          container: true,
          label: l10n.tableLayout(area.name),
          child: DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outline),
              borderRadius: BorderRadius.circular(MakiRadii.card),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MakiRadii.card),
              child: whole
                  ? canvas
                  : SizedBox(
                      width: fill ? constraints.maxWidth : null,
                      height: fill
                          ? constraints.maxHeight
                          : math.min(
                              cell * floorRows,
                              MediaQuery.sizeOf(context).height * 0.6,
                            ),
                      child: InteractiveViewer(
                        constrained: false,
                        minScale: fit / cell,
                        maxScale: 3,
                        child: canvas,
                      ),
                    ),
            ),
          ),
        );
        // A layout smaller than its place sits at its start, as the page's
        // text does.
        return fill
            ? Align(alignment: AlignmentDirectional.topStart, child: framed)
            : framed;
      },
    );
  }
}

/// How a table shows its status: a fill, a border and, but for available,
/// an icon — never the colour alone; the key says what each means.
({Color fill, Color border, Color ink, IconData? icon}) tableStyle(
  BuildContext context,
  TableStatus status,
) {
  final colors = Theme.of(context).colorScheme;
  final tokens = context.tokens;
  return switch (status) {
    TableStatus.available => (
      fill: colors.surface,
      border: tokens.iconMuted,
      ink: colors.onSurface,
      icon: null,
    ),
    TableStatus.occupied => (
      fill: colors.primaryContainer,
      border: tokens.brand,
      ink: colors.onPrimaryContainer,
      icon: Icons.people_outline,
    ),
    TableStatus.inactive => (
      fill: colors.surfaceContainer,
      border: tokens.iconMuted,
      ink: colors.onSurfaceVariant,
      icon: Icons.block,
    ),
    TableStatus.scheduled => (
      fill: colors.surfaceContainer,
      border: tokens.iconMuted,
      ink: colors.onSurfaceVariant,
      icon: Icons.schedule,
    ),
  };
}

/// A table drawn in its box: its shape, its name and seats, its status's
/// fill and icon. A button when [onTap] is given; picked, a strong ring.
class TableMark extends StatelessWidget {
  const TableMark({
    required this.table,
    super.key,
    this.selected = false,
    this.onTap,
  });

  final FloorTable table;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final style = tableStyle(context, table.status);
    final side = BorderSide(
      color: selected ? theme.colorScheme.primary : style.border,
      width: selected ? 3 : 1.5,
    );
    final ShapeBorder shape = switch (table.shape) {
      TableShape.round => OvalBorder(side: side),
      TableShape.square => RoundedRectangleBorder(
        side: side,
        borderRadius: BorderRadius.circular(MakiRadii.card),
      ),
      TableShape.rectangle => RoundedRectangleBorder(
        side: side,
        borderRadius: BorderRadius.circular(MakiRadii.control),
      ),
    };
    final seats = table.capacity;
    return Semantics(
      container: true,
      button: true,
      enabled: onTap != null,
      selected: selected,
      label: tableLabel(l10n, table),
      excludeSemantics: true,
      child: Material(
        color: style.fill,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          customBorder: shape,
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          table.name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: style.ink,
                          ),
                        ),
                        if (seats != null)
                          Text(
                            l10n.tableSeats(seats),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: style.ink,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (style.icon case final icon?)
                Positioned(
                  top: 2,
                  right: 2,
                  child: Icon(icon, size: 12, color: style.ink),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A table's status in words, its fill and icon backing them up.
class TableStatusChip extends StatelessWidget {
  const TableStatusChip(this.status, {super.key});

  final TableStatus status;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final style = tableStyle(context, status);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: style.fill,
        border: Border.all(color: style.border),
        borderRadius: BorderRadius.circular(MakiRadii.field),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: MakiSpacing.sm,
          vertical: 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (style.icon case final icon?) ...[
              Icon(icon, size: 14, color: style.ink),
              const SizedBox(width: MakiSpacing.xs),
            ],
            Text(
              tableStatusLabel(l10n, status),
              style: Theme.of(context).textTheme.labelMedium
                  ?.copyWith(color: style.ink),
            ),
          ],
        ),
      ),
    );
  }
}

/// What the floor's fills and icons mean.
class TableLegend extends StatelessWidget {
  const TableLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Wrap(
      spacing: MakiSpacing.sm,
      runSpacing: MakiSpacing.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          l10n.tableLegend,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        for (final status in TableStatus.values) TableStatusChip(status),
      ],
    );
  }
}

/// A table not placed on the layout, as a button under it.
class _UnplacedTable extends StatelessWidget {
  const _UnplacedTable({
    required this.table,
    required this.picked,
    required this.onPressed,
  });

  final FloorTable table;
  final bool picked;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      container: true,
      button: true,
      enabled: onPressed != null,
      selected: picked,
      label: tableLabel(l10n, table),
      excludeSemantics: true,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          backgroundColor: picked ? colors.primaryContainer : null,
          side: BorderSide(
            color: picked ? context.tokens.brand : colors.outline,
            width: picked ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(table.name),
            const SizedBox(width: MakiSpacing.sm),
            TableStatusChip(table.status),
          ],
        ),
      ),
    );
  }
}

/// The area's grid, a line every cell, and its decorations: a wall
/// filled, the cashier and a door as outlined marks.
class _GridPainter extends CustomPainter {
  _GridPainter({
    required this.cell,
    required this.decorations,
    required this.background,
    required this.line,
    required this.wall,
    required this.mark,
  });

  final double cell;
  final List<FloorDecoration> decorations;
  final Color background;
  final Color line;
  final Color wall;
  final Color mark;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = background);
    final grid = Paint()
      ..color = line
      ..strokeWidth = 1;
    for (var x = 0; x <= floorColumns; x++) {
      canvas.drawLine(Offset(x * cell, 0), Offset(x * cell, size.height), grid);
    }
    for (var y = 0; y <= floorRows; y++) {
      canvas.drawLine(Offset(0, y * cell), Offset(size.width, y * cell), grid);
    }
    for (final decoration in decorations) {
      final box = decoration.box;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(box.x * cell, box.y * cell, box.w * cell, box.h * cell),
        const Radius.circular(3),
      );
      if (decoration.kind == DecorationKind.wall) {
        canvas.drawRRect(rect, Paint()..color = wall);
      } else {
        canvas
          ..drawRRect(rect, Paint()..color = mark)
          ..drawRRect(
            rect,
            Paint()
              ..color = wall
              ..style = PaintingStyle.stroke,
          );
      }
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) =>
      old.cell != cell ||
      old.decorations != decorations ||
      old.background != background ||
      old.line != line;
}
