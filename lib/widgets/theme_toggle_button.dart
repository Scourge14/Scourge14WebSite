import 'package:flutter/material.dart';

import '../core/app_theme.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({
    required this.themeMode,
    required this.onToggle,
    super.key,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggle;

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeMode == ThemeMode.dark;

    return Tooltip(
      message: isDark ? 'Light mode' : 'Dark mode',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onToggle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: context.elevatedSurface.withValues(alpha: .82),
              shape: BoxShape.circle,
              border: Border.all(
                color: _isHovered
                    ? context.premiumGold.withValues(alpha: .56)
                    : context.fineBorder,
              ),
              boxShadow: _isHovered ? context.softShadow : [],
            ),
            child: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              size: 20,
              color: context.primaryText,
            ),
          ),
        ),
      ),
    );
  }
}
