import 'package:flutter/material.dart';

import 'app_palette.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppPalette.softGold,
      brightness: Brightness.light,
      surface: AppPalette.porcelain,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppPalette.ivory,
      colorScheme: colorScheme.copyWith(
        primary: AppPalette.ink,
        secondary: AppPalette.softGold,
        surface: AppPalette.porcelain,
        outline: AppPalette.linen,
      ),
      textTheme: _textTheme(AppPalette.ink),
      iconTheme: const IconThemeData(color: AppPalette.ink),
      dividerColor: AppPalette.linen,
    );
  }

  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppPalette.mutedGold,
      brightness: Brightness.dark,
      surface: AppPalette.walnut,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppPalette.espresso,
      colorScheme: colorScheme.copyWith(
        primary: AppPalette.darkIvory,
        secondary: AppPalette.mutedGold,
        surface: AppPalette.walnut,
        outline: AppPalette.bronzeSmoke,
      ),
      textTheme: _textTheme(AppPalette.darkIvory),
      iconTheme: const IconThemeData(color: AppPalette.darkIvory),
      dividerColor: AppPalette.bronzeSmoke,
    );
  }

  static TextTheme _textTheme(Color color) {
    const fontFamily = 'Avenir Next';
    return TextTheme(
      displayLarge: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 64,
        fontWeight: FontWeight.w700,
        height: 1.02,
      ),
      displayMedium: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 44,
        fontWeight: FontWeight.w700,
        height: 1.1,
      ),
      headlineMedium: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.16,
      ),
      titleLarge: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
      titleMedium: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w700,
        height: 1.35,
      ),
      bodyLarge: TextStyle(
        color: color.withValues(alpha: .78),
        fontFamily: fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        height: 1.65,
      ),
      bodyMedium: TextStyle(
        color: color.withValues(alpha: .72),
        fontFamily: fontFamily,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.55,
      ),
      labelLarge: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
      labelMedium: TextStyle(
        color: color.withValues(alpha: .75),
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
    );
  }
}

extension ThemeColors on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get pageBackground =>
      isDarkMode ? AppPalette.espresso : AppPalette.ivory;

  Color get elevatedSurface =>
      isDarkMode ? AppPalette.walnut : AppPalette.porcelain;

  Color get softSurface =>
      isDarkMode ? AppPalette.bronzeSmoke : AppPalette.linen;

  Color get premiumGold =>
      isDarkMode ? AppPalette.mutedGold : AppPalette.softGold;

  Color get primaryText => isDarkMode ? AppPalette.darkIvory : AppPalette.ink;

  Color get mutedText => primaryText.withValues(alpha: .68);

  Color get fineBorder => isDarkMode
      ? AppPalette.mutedGold.withValues(alpha: .18)
      : AppPalette.softGold.withValues(alpha: .34);

  List<BoxShadow> get softShadow => [
    BoxShadow(
      color: isDarkMode
          ? Colors.black.withValues(alpha: .28)
          : AppPalette.clay.withValues(alpha: .10),
      blurRadius: 34,
      offset: const Offset(0, 18),
    ),
  ];
}
