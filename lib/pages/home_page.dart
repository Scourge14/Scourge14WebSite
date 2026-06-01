import 'package:flutter/material.dart';

import '../core/app_links.dart';
import '../core/app_texts.dart';
import '../core/app_theme.dart';
import '../core/link_launcher.dart';
import '../sections/about_section.dart';
import '../sections/case_study_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/header_nav.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.copy,
    required this.language,
    required this.themeMode,
    required this.onLanguageChanged,
    required this.onThemeToggle,
    super.key,
  });

  final AppTexts copy;
  final AppLanguage language;
  final ThemeMode themeMode;
  final ValueChanged<AppLanguage> onLanguageChanged;
  final VoidCallback onThemeToggle;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();
  String _activeSection = 'about';
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    final shouldShowBackToTop = _scrollController.offset > 520;
    final nextSection = _sectionFromOffset();

    if (shouldShowBackToTop != _showBackToTop ||
        nextSection != _activeSection) {
      setState(() {
        _showBackToTop = shouldShowBackToTop;
        _activeSection = nextSection;
      });
    }
  }

  String _sectionFromOffset() {
    final entries = {
      'about': _aboutKey,
      'skills': _skillsKey,
      'projects': _projectsKey,
      'experience': _experienceKey,
      'contact': _contactKey,
    }.entries;

    var current = 'about';
    for (final entry in entries) {
      final context = entry.value.currentContext;
      if (context == null) continue;
      final renderObject = context.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.hasSize) continue;
      final y = renderObject.localToGlobal(Offset.zero).dy;
      if (y <= 160) current = entry.key;
    }

    return current;
  }

  void _scrollTo(String section) {
    final key = switch (section) {
      'about' => _aboutKey,
      'skills' => _skillsKey,
      'projects' => _projectsKey,
      'experience' => _experienceKey,
      'contact' => _contactKey,
      _ => _aboutKey,
    };

    final context = key.currentContext;
    if (context == null) return;

    setState(() => _activeSection = section);
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 620),
      curve: Curves.easeInOutCubic,
      alignment: .08,
    );
  }

  Future<void> _open(String url) => openLink(url);

  Future<void> _openCv() => openLink('assets/${AppLinks.cvPath}');

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 620),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: context.pageBackground,
      endDrawer: MobileNavDrawer(
        copy: widget.copy,
        activeSection: _activeSection,
        onNavTap: _scrollTo,
      ),
      floatingActionButton: AnimatedScale(
        scale: _showBackToTop ? 1 : 0,
        duration: const Duration(milliseconds: 180),
        child: FloatingActionButton.small(
          tooltip: 'Back to top',
          onPressed: _showBackToTop ? _scrollToTop : null,
          backgroundColor: context.primaryText,
          foregroundColor: context.pageBackground,
          child: const Icon(Icons.keyboard_arrow_up_rounded),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _HeaderDelegate(
              child: HeaderNav(
                copy: widget.copy,
                language: widget.language,
                themeMode: widget.themeMode,
                activeSection: _activeSection,
                onLanguageChanged: widget.onLanguageChanged,
                onThemeToggle: widget.onThemeToggle,
                onNavTap: _scrollTo,
                onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.pageBackground,
                    context.softSurface.withValues(
                      alpha: context.isDarkMode ? .12 : .28,
                    ),
                    context.pageBackground,
                  ],
                  stops: const [0, .46, 1],
                ),
              ),
              child: HeroSection(
                copy: widget.copy,
                onProjectsTap: () => _scrollTo('projects'),
                onCvTap: _openCv,
                onContactTap: () => _scrollTo('contact'),
                onSocialTap: _open,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: KeyedSubtree(
              key: _aboutKey,
              child: AboutSection(copy: widget.copy),
            ),
          ),
          SliverToBoxAdapter(
            child: KeyedSubtree(
              key: _skillsKey,
              child: SkillsSection(copy: widget.copy),
            ),
          ),
          SliverToBoxAdapter(child: CaseStudySection(copy: widget.copy)),
          SliverToBoxAdapter(
            child: KeyedSubtree(
              key: _projectsKey,
              child: ProjectsSection(
                copy: widget.copy,
                onProjectTap: (project) => _open(project.url),
                onDemoTap: (project) => _open(project.demoUrl!),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: KeyedSubtree(
              key: _experienceKey,
              child: ExperienceSection(copy: widget.copy),
            ),
          ),
          SliverToBoxAdapter(
            child: KeyedSubtree(
              key: _contactKey,
              child: ContactSection(
                copy: widget.copy,
                onLinkedinTap: () => _open(AppLinks.linkedinUrl),
                onGithubTap: () => _open(AppLinks.githubUrl),
                onEmailTap: () => _open(AppLinks.mailtoUrl),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FooterSection(
              copy: widget.copy,
              onLinkedinTap: () => _open(AppLinks.linkedinUrl),
              onGithubTap: () => _open(AppLinks.githubUrl),
              onEmailTap: () => _open(AppLinks.mailtoUrl),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  const _HeaderDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 78;

  @override
  double get maxExtent => 78;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _HeaderDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}
