import 'package:flutter/material.dart';
import 'package:maki_mobile/app/theme/tokens.dart';

/// Tokens that Material's [ColorScheme] and [TextTheme] have no slot for.
@immutable
class MakiTokens extends ThemeExtension<MakiTokens> {
  const MakiTokens({
    required this.brand,
    required this.primaryContainerStrong,
    required this.primaryContainerMuted,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.surfaceVariant,
    required this.iconMuted,
    required this.priceLarge,
  });

  static const light = MakiTokens(
    brand: MakiColors.primary,
    primaryContainerStrong: MakiColors.primaryContainerStrong,
    primaryContainerMuted: MakiColors.primaryContainerMuted,
    warningContainer: MakiColors.warningContainer,
    onWarningContainer: MakiColors.onWarningContainer,
    surfaceVariant: MakiColors.surfaceVariant,
    iconMuted: MakiColors.iconMuted,
    priceLarge: TextStyle(
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w700,
    ),
  );

  /// The brand orange, for borders, tints and icon-only fills. Text, icons
  /// on tints and text buttons use `colorScheme.primary` instead, which
  /// passes WCAG AA.
  final Color brand;
  final Color primaryContainerStrong;
  final Color primaryContainerMuted;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color surfaceVariant;
  final Color iconMuted;
  final TextStyle priceLarge;

  @override
  MakiTokens copyWith({
    Color? brand,
    Color? primaryContainerStrong,
    Color? primaryContainerMuted,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? surfaceVariant,
    Color? iconMuted,
    TextStyle? priceLarge,
  }) {
    return MakiTokens(
      brand: brand ?? this.brand,
      primaryContainerStrong:
          primaryContainerStrong ?? this.primaryContainerStrong,
      primaryContainerMuted:
          primaryContainerMuted ?? this.primaryContainerMuted,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      iconMuted: iconMuted ?? this.iconMuted,
      priceLarge: priceLarge ?? this.priceLarge,
    );
  }

  @override
  MakiTokens lerp(MakiTokens? other, double t) {
    if (other == null) return this;
    return MakiTokens(
      brand: Color.lerp(brand, other.brand, t)!,
      primaryContainerStrong: Color.lerp(
        primaryContainerStrong,
        other.primaryContainerStrong,
        t,
      )!,
      primaryContainerMuted: Color.lerp(
        primaryContainerMuted,
        other.primaryContainerMuted,
        t,
      )!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
      onWarningContainer: Color.lerp(
        onWarningContainer,
        other.onWarningContainer,
        t,
      )!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      iconMuted: Color.lerp(iconMuted, other.iconMuted, t)!,
      priceLarge: TextStyle.lerp(priceLarge, other.priceLarge, t)!,
    );
  }
}

extension MakiTokensX on BuildContext {
  MakiTokens get tokens => Theme.of(this).extension<MakiTokens>()!;
}

ThemeData buildAppTheme() {
  const colors = ColorScheme(
    brightness: Brightness.light,
    // Material draws text buttons, filled buttons, switches and links from
    // `primary`, so it holds the orange that passes WCAG AA. The brand
    // orange lives in MakiTokens.brand.
    primary: MakiColors.primaryStrong,
    onPrimary: MakiColors.onPrimary,
    primaryContainer: MakiColors.primaryContainer,
    onPrimaryContainer: MakiColors.onPrimaryContainer,
    // DESIGN.md's blue secondary isn't used in Maki. Material draws
    // selection indicators (the navigation bar pill) from the secondary
    // container, which DESIGN.md makes a strong peach.
    secondary: MakiColors.primaryStrong,
    onSecondary: MakiColors.onPrimary,
    secondaryContainer: MakiColors.primaryContainerStrong,
    onSecondaryContainer: MakiColors.primaryStrong,
    error: MakiColors.error,
    onError: MakiColors.onError,
    errorContainer: MakiColors.errorContainer,
    onErrorContainer: MakiColors.onErrorContainer,
    surface: MakiColors.surface,
    onSurface: MakiColors.onSurface,
    onSurfaceVariant: MakiColors.onSurfaceVariant,
    surfaceDim: MakiColors.surfaceDim,
    surfaceContainerLowest: MakiColors.surface,
    surfaceContainerLow: MakiColors.surfaceContainerLow,
    surfaceContainer: MakiColors.surfaceContainer,
    surfaceContainerHigh: MakiColors.surfaceDim,
    surfaceContainerHighest: MakiColors.surfaceVariant,
    outline: MakiColors.outline,
    outlineVariant: MakiColors.outlineVariant,
  );

  // DESIGN.md's type roles, mapped onto Material's.
  const textTheme = TextTheme(
    // headline-lg
    titleLarge: TextStyle(
      fontSize: 22,
      height: 28 / 22,
      fontWeight: FontWeight.w700,
    ),
    // headline-md
    titleMedium: TextStyle(
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w600,
    ),
    // title-md
    titleSmall: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w600,
    ),
    // body-md
    bodyMedium: TextStyle(fontSize: 13, height: 18 / 13),
    // label-md
    labelMedium: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w600,
    ),
    // label-sm
    labelSmall: TextStyle(fontSize: 10, height: 14 / 10),
  );

  // DESIGN.md's text-field: a white field whose edge has 3:1 against the
  // background (icon-muted), unlike card borders, so it can be found.
  OutlineInputBorder fieldBorder(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(MakiRadii.card),
        borderSide: BorderSide(color: color, width: width),
      );

  return ThemeData(
    fontFamily: MakiFonts.family,
    colorScheme: colors,
    scaffoldBackgroundColor: MakiColors.background,
    textTheme: textTheme.apply(
      bodyColor: MakiColors.onSurface,
      displayColor: MakiColors.onSurface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MakiColors.surface,
      hintStyle: const TextStyle(color: MakiColors.textPlaceholder),
      contentPadding: const EdgeInsets.all(MakiSpacing.md),
      border: fieldBorder(MakiColors.iconMuted),
      enabledBorder: fieldBorder(MakiColors.iconMuted),
      focusedBorder: fieldBorder(MakiColors.primary, width: 2),
      errorBorder: fieldBorder(MakiColors.error),
      focusedErrorBorder: fieldBorder(MakiColors.error, width: 2),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MakiRadii.card),
        ),
        textStyle: const TextStyle(
          fontFamily: MakiFonts.family,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    // A second action beside a filled one: the same size and shape.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MakiRadii.card),
        ),
        textStyle: const TextStyle(
          fontFamily: MakiFonts.family,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(color: MakiColors.outline),
    // DESIGN.md's surfaces are white, apart by a 1px `outline`: not
    // Material's tinted containers.
    dialogTheme: const DialogThemeData(
      backgroundColor: MakiColors.surface,
      surfaceTintColor: Colors.transparent,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: MakiColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: MakiColors.surface,
    ),
    // 48dp touch targets, even where a control looks smaller.
    materialTapTargetSize: MaterialTapTargetSize.padded,
    extensions: const [MakiTokens.light],
  );
}
