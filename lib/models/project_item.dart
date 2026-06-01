class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.description,
    required this.tags,
    required this.url,
    this.demoUrl,
  });

  final String title;
  final String description;
  final List<String> tags;
  final String url;
  final String? demoUrl;
}
