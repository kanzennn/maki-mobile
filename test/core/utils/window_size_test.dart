import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/window_size.dart';

void main() {
  test('switches layouts at the DESIGN.md breakpoints', () {
    expect(windowSizeForWidth(390), WindowSize.compact);
    expect(windowSizeForWidth(599), WindowSize.compact);
    expect(windowSizeForWidth(600), WindowSize.medium);
    expect(windowSizeForWidth(839), WindowSize.medium);
    expect(windowSizeForWidth(840), WindowSize.expanded);
  });
}
