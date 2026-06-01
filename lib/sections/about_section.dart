import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../core/breakpoints.dart';
import '../widgets/hover_card.dart';
import '../widgets/section_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({required this.copy, super.key});

  final AppTexts copy;

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      top: Breakpoints.isMobile(context) ? 54 : 76,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final heading = SectionHeading(
            eyebrow: copy.aboutEyebrow,
            title: copy.aboutTitle,
          );
          final body = HoverCard(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  copy.aboutBody,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: copy.aboutStats
                      .map(
                        (stat) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: context.softSurface.withValues(alpha: .48),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: context.fineBorder),
                          ),
                          child: Text(
                            stat,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          );

          if (constraints.maxWidth < 860) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [heading, const SizedBox(height: 28), body],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: heading),
              const SizedBox(width: 48),
              Expanded(child: body),
            ],
          );
        },
      ),
    );
  }
}
