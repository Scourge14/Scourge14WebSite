import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../core/breakpoints.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({
    required this.child,
    this.top = 92,
    this.bottom = 92,
    super.key,
  });

  final Widget child;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Breakpoints.horizontalPadding(context),
        top,
        Breakpoints.horizontalPadding(context),
        bottom,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    required this.eyebrow,
    required this.title,
    this.description,
    this.maxWidth = 760,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String? description;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eyebrow.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: context.premiumGold,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: Breakpoints.isMobile(context) ? 32 : 44,
            ),
          ),
          if (description != null) ...[
            const SizedBox(height: 18),
            Text(description!, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ],
      ),
    );
  }
}
