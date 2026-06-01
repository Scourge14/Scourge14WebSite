import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({
    required this.language,
    required this.onChanged,
    super.key,
  });

  final AppLanguage language;
  final ValueChanged<AppLanguage> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.elevatedSurface.withValues(alpha: .82),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: context.fineBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguagePill(
            label: 'TR',
            isSelected: language == AppLanguage.tr,
            onTap: () => onChanged(AppLanguage.tr),
          ),
          _LanguagePill(
            label: 'EN',
            isSelected: language == AppLanguage.en,
            onTap: () => onChanged(AppLanguage.en),
          ),
        ],
      ),
    );
  }
}

class _LanguagePill extends StatelessWidget {
  const _LanguagePill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? context.primaryText : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: isSelected ? context.pageBackground : context.mutedText,
          ),
        ),
      ),
    );
  }
}
