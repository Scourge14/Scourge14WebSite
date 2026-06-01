import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../core/breakpoints.dart';
import '../widgets/hover_card.dart';
import '../widgets/section_shell.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    required this.copy,
    required this.onLinkedinTap,
    required this.onGithubTap,
    required this.onEmailTap,
    super.key,
  });

  final AppTexts copy;
  final VoidCallback onLinkedinTap;
  final VoidCallback onGithubTap;
  final VoidCallback onEmailTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);

    return SectionShell(
      child: HoverCard(
        padding: EdgeInsets.all(isMobile ? 24 : 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              eyebrow: copy.contactEyebrow,
              title: copy.contactTitle,
              description: copy.contactDescription,
              maxWidth: 820,
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                _ContactButton(
                  icon: Icons.business_center_outlined,
                  label: copy.linkedin,
                  onTap: onLinkedinTap,
                ),
                _ContactButton(
                  icon: Icons.code_rounded,
                  label: copy.github,
                  onTap: onGithubTap,
                ),
                _ContactButton(
                  icon: Icons.mail_outline_rounded,
                  label: copy.email,
                  onTap: onEmailTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: _isHovered
                ? context.primaryText
                : context.softSurface.withValues(alpha: .45),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: _isHovered ? context.primaryText : context.fineBorder,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 19,
                color: _isHovered
                    ? context.pageBackground
                    : context.premiumGold,
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: _isHovered
                      ? context.pageBackground
                      : context.primaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
