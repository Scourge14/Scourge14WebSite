import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../models/experience_item.dart';
import '../widgets/hover_card.dart';
import '../widgets/section_shell.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({required this.copy, super.key});

  final AppTexts copy;

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            eyebrow: copy.experienceEyebrow,
            title: copy.experienceTitle,
          ),
          const SizedBox(height: 34),
          ...copy.experiences.asMap().entries.map(
            (entry) => Padding(
              padding: EdgeInsets.only(
                bottom: entry.key == copy.experiences.length - 1 ? 0 : 18,
              ),
              child: _TimelineCard(
                item: entry.value,
                isLast: entry.key == copy.experiences.length - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineCard extends StatelessWidget {
  const _TimelineCard({required this.item, required this.isLast});

  final ExperienceItem item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.premiumGold,
                    boxShadow: [
                      BoxShadow(
                        color: context.premiumGold.withValues(alpha: .28),
                        blurRadius: 18,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 1,
                    height: 210,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    color: context.fineBorder,
                  ),
              ],
            ),
            const SizedBox(width: 22),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.period,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: context.premiumGold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.company,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.role,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: context.mutedText),
                  ),
                  const SizedBox(height: 16),
                  ...item.highlights.map(
                    (highlight) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.circle,
                              size: 6,
                              color: context.premiumGold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              highlight,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
