import 'package:flutter/material.dart';

import '../core/app_theme.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap == null
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.018 : 1,
          duration: const Duration(milliseconds: 190),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 190),
            curve: Curves.easeOut,
            padding: widget.padding,
            decoration: BoxDecoration(
              color: context.elevatedSurface.withValues(
                alpha: context.isDarkMode ? .82 : .94,
              ),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: _isHovered
                    ? context.premiumGold.withValues(alpha: .58)
                    : context.fineBorder,
              ),
              boxShadow: _isHovered ? context.softShadow : [],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
