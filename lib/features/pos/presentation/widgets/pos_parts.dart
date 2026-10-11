import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// Small pieces the cashier's screens share.

/// A filled or outlined button that sits in a row: the theme makes buttons
/// as wide as their column.
final ButtonStyle inlineButton = ButtonStyle(
  minimumSize: WidgetStateProperty.all(const Size(64, 48)),
);

/// A category's emoji, or a plate for one without. Decoration only: the
/// category's name says what it is.
class CategoryEmoji extends StatelessWidget {
  const CategoryEmoji(this.icon, {super.key, this.size = 24});

  final String? icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return ExcludeSemantics(
      child: icon == null
          ? Icon(
              Icons.restaurant_outlined,
              size: size,
              color: context.tokens.iconMuted,
            )
          : Text(icon, style: TextStyle(fontSize: size, height: 1)),
    );
  }
}

/// What changed, or why a sale was refused: a warning box above the menus,
/// which a screen reader announces, until dismissed.
class NoticeBox extends StatelessWidget {
  const NoticeBox({
    required this.sentences,
    required this.onDismiss,
    super.key,
  });

  final List<String> sentences;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tokens = context.tokens;
    final style = Theme.of(context).textTheme.bodyMedium
        ?.copyWith(color: tokens.onWarningContainer);
    return Semantics(
      liveRegion: true,
      container: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: tokens.warningContainer,
          borderRadius: BorderRadius.circular(MakiRadii.control),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: MakiSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: MakiSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final sentence in sentences)
                        Text(sentence, style: style),
                    ],
                  ),
                ),
              ),
              IconButton(
                tooltip: l10n.close,
                onPressed: onDismiss,
                icon: Icon(Icons.close, color: tokens.onWarningContainer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Something that couldn't load: what, why, the request ID to quote, and
/// a way to try again.
class LoadFailed extends StatelessWidget {
  const LoadFailed({
    required this.title,
    required this.error,
    required this.onRetry,
    super.key,
  });

  final String title;
  final ApiException error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final muted = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final requestId = error.requestId;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(MakiSpacing.lg),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.cloud_off_outlined,
                size: 40,
                color: context.tokens.iconMuted,
              ),
              const SizedBox(height: MakiSpacing.lg),
              Semantics(
                header: true,
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: MakiSpacing.sm),
              Text(
                apiErrorMessage(l10n, error),
                style: muted,
                textAlign: TextAlign.center,
              ),
              if (requestId != null) ...[
                const SizedBox(height: MakiSpacing.xs),
                SelectableText(
                  l10n.errorRequestId(requestId),
                  style: muted,
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: MakiSpacing.xl),
              OutlinedButton(onPressed: onRetry, child: Text(l10n.retry)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Paid or Void, in words, not by colour alone.
class StatusBadge extends StatelessWidget {
  const StatusBadge(this.status, {super.key});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    final (fill, ink, label) = switch (status) {
      OrderStatus.paid => (
        colors.surfaceContainer,
        colors.onSurfaceVariant,
        l10n.historyPaid,
      ),
      OrderStatus.voided => (
        colors.errorContainer,
        colors.onErrorContainer,
        l10n.historyVoid,
      ),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(MakiRadii.field),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: MakiSpacing.sm,
          vertical: 2,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ink),
        ),
      ),
    );
  }
}

/// A label and its value on one line, the value at the end, as receipts
/// and summaries have them. A value too long for the line — larger system
/// text on a narrow phone — wraps instead of running past the edge; it takes
/// at most 60% of the line, and the label the rest.
class LabelValue extends StatelessWidget {
  const LabelValue(
    this.label,
    this.value, {
    super.key,
    this.style,
    this.labelStyle,
  });

  final String label;
  final String value;
  final TextStyle? style;

  /// The label's own style, when it differs from the value's.
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(label, style: labelStyle ?? style)),
        const SizedBox(width: MakiSpacing.md),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.6),
          child: Text(value, style: style, textAlign: TextAlign.end),
        ),
      ],
    ),
  );
}

/// A dashed rule, as before a total.
class DashedDivider extends StatelessWidget {
  const DashedDivider({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 1,
    width: double.infinity,
    child: CustomPaint(
      painter: _Dashes(color ?? Theme.of(context).colorScheme.outline),
    ),
  );
}

class _Dashes extends CustomPainter {
  const _Dashes(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height;
    for (var x = 0.0; x < size.width; x += 8) {
      canvas.drawLine(Offset(x, 0), Offset(x + 4, 0), paint);
    }
  }

  @override
  bool shouldRepaint(_Dashes old) => old.color != color;
}

/// Keeps a text to [max] characters as the server counts them: Unicode
/// code points, which an emoji may be two UTF-16 units of.
class CodePointLimit extends TextInputFormatter {
  const CodePointLimit(this.max);

  final int max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) => newValue.text.runes.length <= max ? newValue : oldValue;
}

/// Small letters as capitals as they are typed, so the field shows what is
/// kept. A letter whose capital is longer (ß) stays as it is: the cursor
/// keeps its place.
class Capitals extends TextInputFormatter {
  const Capitals();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final upper = newValue.text.toUpperCase();
    return upper.length == newValue.text.length
        ? newValue.copyWith(text: upper)
        : newValue;
  }
}
