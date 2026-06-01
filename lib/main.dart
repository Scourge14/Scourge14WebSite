import 'package:flutter/material.dart';

import 'core/app_texts.dart';
import 'core/app_theme.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const EmreCanPortfolioApp());
}

class EmreCanPortfolioApp extends StatefulWidget {
  const EmreCanPortfolioApp({super.key});

  @override
  State<EmreCanPortfolioApp> createState() => _EmreCanPortfolioAppState();
}

class _EmreCanPortfolioAppState extends State<EmreCanPortfolioApp> {
  ThemeMode _themeMode = ThemeMode.light;
  AppLanguage _language = AppLanguage.tr;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  void _setLanguage(AppLanguage language) {
    setState(() {
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final copy = AppTexts.of(_language);

    return MaterialApp(
      title: 'Emre Can Karacaağaçlı | Technical Analyst',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: HomePage(
        copy: copy,
        language: _language,
        themeMode: _themeMode,
        onLanguageChanged: _setLanguage,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}
