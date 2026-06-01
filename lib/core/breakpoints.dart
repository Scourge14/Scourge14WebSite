import 'package:flutter/widgets.dart';

class Breakpoints {
  const Breakpoints._();

  static const mobile = 720.0;
  static const tablet = 1024.0;
  static const desktop = 1280.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobile;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= mobile && width < tablet;
  }

  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= desktop) return 72;
    if (width >= tablet) return 48;
    if (width >= mobile) return 32;
    return 20;
  }

  static int skillColumns(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1180) return 4;
    if (width >= 820) return 3;
    if (width >= 560) return 2;
    return 1;
  }

  static int projectColumns(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1020) return 3;
    if (width >= 680) return 2;
    return 1;
  }
}
