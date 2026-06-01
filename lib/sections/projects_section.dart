import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../core/breakpoints.dart';
import '../models/project_item.dart';
import '../widgets/hover_card.dart';
import '../widgets/section_shell.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    required this.copy,
    required this.onProjectTap,
    required this.onDemoTap,
    super.key,
  });

  final AppTexts copy;
  final ValueChanged<ProjectItem> onProjectTap;
  final ValueChanged<ProjectItem> onDemoTap;

  @override
  Widget build(BuildContext context) {
    final columns = Breakpoints.projectColumns(context);

    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            eyebrow: copy.projectsEyebrow,
            title: copy.projectsTitle,
            description: copy.projectsDescription,
          ),
          const SizedBox(height: 34),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: copy.projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: columns == 1 ? .82 : .86,
            ),
            itemBuilder: (context, index) {
              return _ProjectCard(
                project: copy.projects[index],
                detailsLabel: copy.projectDetails,
                demoLabel: copy.projectDemo,
                onDetailsTap: () => onProjectTap(copy.projects[index]),
                onDemoTap: copy.projects[index].demoUrl == null
                    ? null
                    : () => onDemoTap(copy.projects[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.project,
    required this.detailsLabel,
    required this.demoLabel,
    required this.onDetailsTap,
    required this.onDemoTap,
  });

  final ProjectItem project;
  final String detailsLabel;
  final String demoLabel;
  final VoidCallback onDetailsTap;
  final VoidCallback? onDemoTap;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [
                  context.softSurface.withValues(alpha: .42),
                  context.premiumGold.withValues(
                    alpha: context.isDarkMode ? .18 : .22,
                  ),
                ],
              ),
              border: Border.all(color: context.fineBorder),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Icon(
                  Icons.schema_outlined,
                  color: context.premiumGold,
                  size: 28,
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            project.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              project.description,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tags
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: context.softSurface.withValues(alpha: .48),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: context.fineBorder),
                    ),
                    child: Text(
                      tag,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 14,
            runSpacing: 8,
            children: [
              TextButton.icon(
                onPressed: onDetailsTap,
                icon: const Icon(Icons.code_rounded, size: 18),
                label: Text(detailsLabel),
                style: TextButton.styleFrom(
                  foregroundColor: context.primaryText,
                  padding: EdgeInsets.zero,
                ),
              ),
              if (onDemoTap != null)
                TextButton.icon(
                  onPressed: onDemoTap,
                  icon: const Icon(Icons.arrow_outward_rounded, size: 18),
                  label: Text(demoLabel),
                  style: TextButton.styleFrom(
                    foregroundColor: context.premiumGold,
                    padding: EdgeInsets.zero,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
