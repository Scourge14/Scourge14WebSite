import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../core/breakpoints.dart';
import '../widgets/language_toggle.dart';
import '../widgets/theme_toggle_button.dart';

class HeaderNav extends StatelessWidget {
  const HeaderNav({
    required this.copy,
    required this.language,
    required this.themeMode,
    required this.activeSection,
    required this.onLanguageChanged,
    required this.onThemeToggle,
    required this.onNavTap,
    required this.onMenuTap,
    super.key,
  });

  final AppTexts copy;
  final AppLanguage language;
  final ThemeMode themeMode;
  final String activeSection;
  final ValueChanged<AppLanguage> onLanguageChanged;
  final VoidCallback onThemeToggle;
  final ValueChanged<String> onNavTap;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 980;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: 78,
          padding: EdgeInsets.symmetric(
            horizontal: Breakpoints.horizontalPadding(context),
          ),
          decoration: BoxDecoration(
            color: context.pageBackground.withValues(
              alpha: context.isDarkMode ? .78 : .84,
            ),
            border: Border(bottom: BorderSide(color: context.fineBorder)),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1180),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.fineBorder),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/kedi.webp'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Emre Can',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (!isCompact) ...[
                    _DesktopNav(
                      copy: copy,
                      activeSection: activeSection,
                      onNavTap: onNavTap,
                    ),
                    const SizedBox(width: 22),
                    LanguageToggle(
                      language: language,
                      onChanged: onLanguageChanged,
                    ),
                    const SizedBox(width: 10),
                    ThemeToggleButton(
                      themeMode: themeMode,
                      onToggle: onThemeToggle,
                    ),
                  ] else ...[
                    LanguageToggle(
                      language: language,
                      onChanged: onLanguageChanged,
                    ),
                    const SizedBox(width: 8),
                    ThemeToggleButton(
                      themeMode: themeMode,
                      onToggle: onThemeToggle,
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      tooltip: 'Menu',
                      onPressed: onMenuTap,
                      icon: const Icon(Icons.menu_rounded),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DesktopNav extends StatelessWidget {
  const _DesktopNav({
    required this.copy,
    required this.activeSection,
    required this.onNavTap,
  });

  final AppTexts copy;
  final String activeSection;
  final ValueChanged<String> onNavTap;

  @override
  Widget build(BuildContext context) {
    final items = {
      'about': copy.menuAbout,
      'skills': copy.menuSkills,
      'projects': copy.menuProjects,
      'experience': copy.menuExperience,
      'contact': copy.menuContact,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: items.entries
          .map(
            (entry) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _NavButton(
                label: entry.value,
                isActive: activeSection == entry.key,
                onTap: () => onNavTap(entry.key),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: isActive ? context.primaryText : context.mutedText,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          const SizedBox(height: 5),
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: isActive ? 18 : 0,
            height: 2,
            decoration: BoxDecoration(
              color: context.premiumGold,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({
    required this.copy,
    required this.activeSection,
    required this.onNavTap,
    super.key,
  });

  final AppTexts copy;
  final String activeSection;
  final ValueChanged<String> onNavTap;

  @override
  Widget build(BuildContext context) {
    final items = {
      'about': copy.menuAbout,
      'skills': copy.menuSkills,
      'projects': copy.menuProjects,
      'experience': copy.menuExperience,
      'contact': copy.menuContact,
    };

    return Drawer(
      backgroundColor: context.pageBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Emre Can', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 24),
              ...items.entries.map(
                (entry) => ListTile(
                  selected: activeSection == entry.key,
                  selectedTileColor: context.softSurface.withValues(alpha: .36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  title: Text(entry.value),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    onNavTap(entry.key);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
