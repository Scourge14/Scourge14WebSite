import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_links.dart';
import '../core/app_theme.dart';
import '../core/breakpoints.dart';
import '../widgets/animated_reveal.dart';
import '../widgets/premium_button.dart';
import '../widgets/section_shell.dart';
import '../widgets/social_icon_button.dart';
import 'abstract_api_panel.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    required this.copy,
    required this.onProjectsTap,
    required this.onCvTap,
    required this.onContactTap,
    required this.onSocialTap,
    super.key,
  });

  final AppTexts copy;
  final VoidCallback onProjectsTap;
  final VoidCallback onCvTap;
  final VoidCallback onContactTap;
  final ValueChanged<String> onSocialTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);

    return SectionShell(
      top: isMobile ? 62 : 92,
      bottom: isMobile ? 58 : 86,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final heroText = AnimatedReveal(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: context.elevatedSurface.withValues(alpha: .72),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: context.fineBorder),
                  ),
                  child: Text(
                    copy.heroEyebrow,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: context.premiumGold,
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                Text(
                  copy.heroTitle,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: isMobile ? 40 : 64,
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  copy.heroDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 34),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    PremiumButton(
                      label: copy.heroPrimaryCta,
                      icon: Icons.work_outline_rounded,
                      onPressed: onProjectsTap,
                    ),
                    PremiumButton(
                      label: copy.heroSecondaryCta,
                      icon: Icons.arrow_forward_rounded,
                      variant: PremiumButtonVariant.outline,
                      onPressed: onContactTap,
                    ),
                    _CvButton(label: copy.heroCvCta, onPressed: onCvTap),
                  ],
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SocialIconButton(
                      icon: Icons.business_center_outlined,
                      label: copy.linkedin,
                      onTap: () => onSocialTap(AppLinks.linkedinUrl),
                    ),
                    SocialIconButton(
                      icon: Icons.code_rounded,
                      label: copy.github,
                      onTap: () => onSocialTap(AppLinks.githubUrl),
                    ),
                    SocialIconButton(
                      icon: Icons.mail_outline_rounded,
                      label: copy.email,
                      onTap: () => onSocialTap(AppLinks.mailtoUrl),
                    ),
                  ],
                ),
              ],
            ),
          );

          final panel = AnimatedReveal(
            delay: const Duration(milliseconds: 120),
            child: AbstractApiPanel(copy: copy),
          );

          if (constraints.maxWidth < 900) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heroText,
                const SizedBox(height: 42),
                Center(child: panel),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 11, child: heroText),
              const SizedBox(width: 54),
              Expanded(flex: 9, child: panel),
            ],
          );
        },
      ),
    );
  }
}

class _CvButton extends StatelessWidget {
  const _CvButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.download_rounded, size: 18),
        label: Text(label, overflow: TextOverflow.ellipsis),
        style:
            ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(122, 54),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              backgroundColor: context.elevatedSurface.withValues(
                alpha: context.isDarkMode ? .74 : .82,
              ),
              foregroundColor: context.primaryText,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
                side: BorderSide(color: context.fineBorder),
              ),
            ).copyWith(
              overlayColor: WidgetStatePropertyAll(
                context.premiumGold.withValues(alpha: .12),
              ),
            ),
      ),
    );
  }
}
