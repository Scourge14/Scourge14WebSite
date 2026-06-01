import 'package:flutter/material.dart';

import '../core/app_theme.dart';

class SocialIconButton extends StatefulWidget {
  const SocialIconButton({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.label,
      child: Semantics(
        button: true,
        label: widget.label,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 46,
              height: 46,
              transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isHovered
                    ? context.primaryText
                    : context.elevatedSurface.withValues(alpha: .76),
                border: Border.all(
                  color: _isHovered ? context.primaryText : context.fineBorder,
                ),
                boxShadow: _isHovered ? context.softShadow : [],
              ),
              child: Icon(
                widget.icon,
                size: 20,
                color: _isHovered
                    ? context.pageBackground
                    : context.primaryText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
