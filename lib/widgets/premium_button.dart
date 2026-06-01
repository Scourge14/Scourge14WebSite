import 'package:flutter/material.dart';

import '../core/app_theme.dart';

enum PremiumButtonVariant { filled, outline }

class PremiumButton extends StatefulWidget {
  const PremiumButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.variant = PremiumButtonVariant.filled,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final PremiumButtonVariant variant;

  @override
  State<PremiumButton> createState() => _PremiumButtonState();
}

class _PremiumButtonState extends State<PremiumButton> {
  bool _isHovered = false;

  bool get _isFilled => widget.variant == PremiumButtonVariant.filled;

  @override
  Widget build(BuildContext context) {
    final background = _isFilled
        ? context.primaryText
        : context.elevatedSurface.withValues(
            alpha: context.isDarkMode ? .74 : .82,
          );
    final foreground = _isFilled ? context.pageBackground : context.primaryText;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: _isFilled ? context.primaryText : context.fineBorder,
            ),
            boxShadow: _isHovered ? context.softShadow : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 18, color: foreground),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  widget.label,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: foreground),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
