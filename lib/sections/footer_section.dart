import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../core/breakpoints.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
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

    return Padding(
      padding: EdgeInsets.fromLTRB(
        Breakpoints.horizontalPadding(context),
        28,
        Breakpoints.horizontalPadding(context),
        34,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: context.fineBorder)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                    copy.footerText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (!isMobile) const Spacer() else const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    children: [
                      _FooterLink(
                        icon: Icons.business_center_outlined,
                        label: copy.linkedin,
                        onTap: onLinkedinTap,
                      ),
                      _FooterLink(
                        icon: Icons.code_rounded,
                        label: copy.github,
                        onTap: onGithubTap,
                      ),
                      _FooterLink(
                        icon: Icons.mail_outline_rounded,
                        label: copy.email,
                        onTap: onEmailTap,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: label,
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: context.mutedText,
        padding: const EdgeInsets.all(10),
      ),
      icon: Icon(icon, size: 20),
    );
  }
}
