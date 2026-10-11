import 'dart:ui';

/// Design tokens from `Maki/DESIGN.md`. Widgets reach them through the theme
/// (`Theme.of(context)`, `context.tokens`), never as raw `Color(0x…)` values.
abstract final class MakiColors {
  static const background = Color(0xFFFFFFFF);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceDim = Color(0xFFF3F3F3);
  static const surfaceContainerLow = Color(0xFFFCFBFC);
  static const surfaceContainer = Color(0xFFF4F4F4);
  static const surfaceVariant = Color(0xFFF3F3F3);
  static const onSurface = Color(0xFF050505);
  static const onSurfaceVariant = Color(0xFF6B6B6B);
  static const outline = Color(0xFFEBEBEB);
  static const outlineVariant = Color(0xFFF4F4F4);
  static const iconMuted = Color(0xFF8A8A8A);
  static const textPlaceholder = Color(0xFF737373);

  /// The brand orange: borders, tints, focus rings and icon-only fills. As
  /// text it fails WCAG AA (3.1:1 on white).
  static const primary = Color(0xFFFF5C33);

  /// Orange for text, icons on tints and buttons with a text label.
  static const primaryStrong = Color(0xFFBC3F0B);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFFFEFEB);
  static const onPrimaryContainer = Color(0xFFBC3F0B);
  static const primaryContainerStrong = Color(0xFFFFDFD8);
  static const primaryContainerMuted = Color(0xFFFBECE8);

  static const warningContainer = Color(0xFFFEF3C7);
  static const onWarningContainer = Color(0xFF92400E);

  static const error = Color(0xFFB42318);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFEE4E2);
  static const onErrorContainer = Color(0xFF912018);
}

abstract final class MakiFonts {
  /// Plus Jakarta Sans, bundled in assets/fonts (pubspec.yaml).
  static const family = 'PlusJakartaSans';
}

abstract final class MakiRadii {
  /// Stepper buttons.
  static const control = 4.0;

  /// Product cards and thumbnails.
  static const card = 8.0;

  /// Category and payment tiles.
  static const tile = 10.0;

  /// Navigation pill and search field.
  static const field = 12.0;
}

/// Spacing on a 4px rhythm.
abstract final class MakiSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
}

/// Window widths where the layout changes (DESIGN.md, "Phone and narrow
/// screens").
abstract final class MakiBreakpoints {
  /// From here, the product grid has three columns instead of two.
  static const medium = 600.0;

  /// From here, the wide three-column layout replaces the phone layout.
  static const expanded = 840.0;
}
