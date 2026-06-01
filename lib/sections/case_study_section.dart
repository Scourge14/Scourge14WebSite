import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../widgets/hover_card.dart';
import '../widgets/section_shell.dart';

class CaseStudySection extends StatelessWidget {
  const CaseStudySection({required this.copy, super.key});

  final AppTexts copy;

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      top: 72,
      bottom: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            eyebrow: copy.caseStudyEyebrow,
            title: copy.caseStudyTitle,
            description: copy.caseStudyDescription,
          ),
          const SizedBox(height: 30),
          HoverCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                for (var i = 0; i < copy.caseStudySteps.length; i++) ...[
                  _CaseStudyStep(index: i + 1, text: copy.caseStudySteps[i]),
                  if (i != copy.caseStudySteps.length - 1)
                    Divider(height: 28, color: context.fineBorder),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CaseStudyStep extends StatelessWidget {
  const _CaseStudyStep({required this.index, required this.text});

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.premiumGold.withValues(alpha: .14),
            shape: BoxShape.circle,
            border: Border.all(
              color: context.premiumGold.withValues(alpha: .34),
            ),
          ),
          child: Text(
            '$index',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: context.premiumGold,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
      ],
    );
  }
}
