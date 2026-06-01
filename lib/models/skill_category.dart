import 'package:flutter/material.dart';

class SkillCategory {
  const SkillCategory({
    required this.icon,
    required this.title,
    required this.items,
  });

  final IconData icon;
  final String title;
  final List<String> items;
}
