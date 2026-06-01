import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../core/breakpoints.dart';
import '../models/skill_category.dart';
import '../widgets/hover_card.dart';
import '../widgets/section_shell.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({required this.copy, super.key});

  final AppTexts copy;

  @override
  Widget build(BuildContext context) {
    final columns = Breakpoints.skillColumns(context);

    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            eyebrow: copy.skillsEyebrow,
            title: copy.skillsTitle,
            description: copy.skillsDescription,
          ),
          const SizedBox(height: 34),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: copy.skillCategories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: columns == 1 ? 1.55 : .92,
            ),
            itemBuilder: (context, index) =>
                _SkillCard(category: copy.skillCategories[index]),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.category});

  final SkillCategory category;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: context.softSurface.withValues(alpha: .5),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: context.fineBorder),
            ),
            child: Icon(category.icon, color: context.premiumGold, size: 22),
          ),
          const SizedBox(height: 16),
          Text(
            category.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 14),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: category.items
                  .map(
                    (item) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: context.softSurface.withValues(alpha: .46),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: context.fineBorder),
                      ),
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
