import 'package:flutter/widgets.dart';
import 'package:maki_mobile/app/theme/tokens.dart';

/// Layouts follow the window width, never the device type.
enum WindowSize {
  /// Phones: the phone layout with a two-column grid.
  compact,

  /// Tablets in portrait: the phone layout with a three-column grid.
  medium,

  /// Tablets in landscape: the wide three-column layout.
  expanded,
}

WindowSize windowSizeForWidth(double width) {
  if (width >= MakiBreakpoints.expanded) return WindowSize.expanded;
  if (width >= MakiBreakpoints.medium) return WindowSize.medium;
  return WindowSize.compact;
}

extension WindowSizeX on BuildContext {
  WindowSize get windowSize =>
      windowSizeForWidth(MediaQuery.sizeOf(this).width);
}
