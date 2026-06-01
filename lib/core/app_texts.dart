import 'package:flutter/material.dart';

import '../models/experience_item.dart';
import '../models/project_item.dart';
import '../models/skill_category.dart';

enum AppLanguage { tr, en }

class AppTexts {
  const AppTexts({
    required this.language,
    required this.menuAbout,
    required this.menuSkills,
    required this.menuProjects,
    required this.menuExperience,
    required this.menuContact,
    required this.heroEyebrow,
    required this.heroTitle,
    required this.heroDescription,
    required this.heroPrimaryCta,
    required this.heroCvCta,
    required this.heroSecondaryCta,
    required this.panelTitle,
    required this.panelSubtitle,
    required this.panelMetricOne,
    required this.panelMetricTwo,
    required this.panelMetricThree,
    required this.aboutEyebrow,
    required this.aboutTitle,
    required this.aboutBody,
    required this.aboutStats,
    required this.skillsEyebrow,
    required this.skillsTitle,
    required this.skillsDescription,
    required this.caseStudyEyebrow,
    required this.caseStudyTitle,
    required this.caseStudyDescription,
    required this.caseStudySteps,
    required this.projectsEyebrow,
    required this.projectsTitle,
    required this.projectsDescription,
    required this.projectDetails,
    required this.projectDemo,
    required this.experienceEyebrow,
    required this.experienceTitle,
    required this.contactEyebrow,
    required this.contactTitle,
    required this.contactDescription,
    required this.email,
    required this.linkedin,
    required this.github,
    required this.footerText,
    required this.skillCategories,
    required this.experiences,
    required this.projects,
  });

  final AppLanguage language;
  final String menuAbout;
  final String menuSkills;
  final String menuProjects;
  final String menuExperience;
  final String menuContact;
  final String heroEyebrow;
  final String heroTitle;
  final String heroDescription;
  final String heroPrimaryCta;
  final String heroCvCta;
  final String heroSecondaryCta;
  final String panelTitle;
  final String panelSubtitle;
  final String panelMetricOne;
  final String panelMetricTwo;
  final String panelMetricThree;
  final String aboutEyebrow;
  final String aboutTitle;
  final String aboutBody;
  final List<String> aboutStats;
  final String skillsEyebrow;
  final String skillsTitle;
  final String skillsDescription;
  final String caseStudyEyebrow;
  final String caseStudyTitle;
  final String caseStudyDescription;
  final List<String> caseStudySteps;
  final String projectsEyebrow;
  final String projectsTitle;
  final String projectsDescription;
  final String projectDetails;
  final String projectDemo;
  final String experienceEyebrow;
  final String experienceTitle;
  final String contactEyebrow;
  final String contactTitle;
  final String contactDescription;
  final String email;
  final String linkedin;
  final String github;
  final String footerText;
  final List<SkillCategory> skillCategories;
  final List<ExperienceItem> experiences;
  final List<ProjectItem> projects;

  static AppTexts of(AppLanguage language) {
    return language == AppLanguage.tr ? _tr : _en;
  }

  static const _tr = AppTexts(
    language: AppLanguage.tr,
    menuAbout: 'Hakkımda',
    menuSkills: 'Yetkinlikler',
    menuProjects: 'Projeler',
    menuExperience: 'Deneyim',
    menuContact: 'İletişim',
    heroEyebrow: 'Technical Analysis Specialist',
    heroTitle:
        'Bankacılık teknolojileri, API entegrasyonları ve süreç analizi odağında teknik analist.',
    heroDescription:
        'Bildirim süreçleri, sistem entegrasyonları, test senaryoları ve teknik dokümantasyon alanlarında iş ihtiyaçlarını uygulanabilir teknik çözümlere dönüştürüyorum.',
    heroPrimaryCta: 'Projelerimi Gör',
    heroCvCta: 'CV İndir',
    heroSecondaryCta: 'Benimle İletişime Geç',
    panelTitle: 'Notification & API Flow',
    panelSubtitle: 'Requirement to validated integration',
    panelMetricOne: 'API',
    panelMetricTwo: 'MSSQL',
    panelMetricThree: 'UAT',
    aboutEyebrow: 'Hakkımda',
    aboutTitle:
        'Bankacılık teknolojilerinde iş ihtiyacını teknik akışa dönüştüren analitik bir çalışma pratiği.',
    aboutBody:
        'Yaklaşık 3 yıldır bankacılık ve teknoloji alanında teknik analist olarak görev yapıyorum. Bildirim süreçleri, API entegrasyonları, veri analizi, test senaryosu hazırlama ve süreç iyileştirme alanlarında deneyim sahibiyim. Azure DevOps, MSSQL, Postman ve Swagger gibi araçlarla teknik gereksinim analizi, iş kuralları dokümantasyonu, regresyon testleri, entegrasyon doğrulama ve canlı ortam süreç koordinasyonu yürütüyorum.',
    aboutStats: [
      'Yaklaşık 3 yıl deneyim',
      'Bildirim süreçleri',
      'API entegrasyonları',
      'Regresyon ve UAT',
    ],
    skillsEyebrow: 'Yetkinlikler',
    skillsTitle:
        'Teknik analiz, entegrasyon ve test odağında derli toplu bir araç seti.',
    skillsDescription:
        'Araçları ve yetkinlikleri kalabalık bir liste gibi değil; analiz, dokümantasyon, entegrasyon, test ve raporlama akışlarını destekleyen net kategoriler halinde kullanıyorum.',
    caseStudyEyebrow: 'Case Study',
    caseStudyTitle: 'Bir API entegrasyonunu analiz ederken izlediğim akış.',
    caseStudyDescription:
        'CV deneyimimle uyumlu şekilde, iş ihtiyacını teknik gereksinime dönüştüren sade ve ölçülebilir bir analiz yaklaşımı kullanıyorum.',
    caseStudySteps: [
      'İhtiyaç ve iş kuralı netleştirme',
      'Endpoint, request-response ve hata senaryosu analizi',
      'Postman/Swagger üzerinden doğrulama ve test senaryosu hazırlığı',
      'Azure DevOps üzerinde dokümantasyon, takip ve UAT koordinasyonu',
    ],
    projectsEyebrow: 'Projeler',
    projectsTitle:
        'CV deneyimimle örtüşen teknik analiz odaklı çalışma alanları.',
    projectsDescription: 'GitHub üzerinde yayınladığım öne çıkan projeler.',
    projectDetails: 'GitHub’da Aç',
    projectDemo: 'Canlı Demo',
    experienceEyebrow: 'Deneyim',
    experienceTitle:
        'Bankacılık, e-ticaret operasyonları ve proje süreçlerinden gelen uçtan uca deneyim.',
    contactEyebrow: 'İletişim',
    contactTitle: 'Yeni fikirleri, akışları ve ürün ihtiyaçlarını konuşalım.',
    contactDescription:
        'LinkedIn, GitHub veya e-posta üzerinden doğrudan ulaşabilirsiniz.',
    email: 'E-posta',
    linkedin: 'LinkedIn',
    github: 'GitHub',
    footerText: '© 2026 Emre Can Karacaağaçlı. Tüm hakları saklıdır.',
    skillCategories: [
      SkillCategory(
        icon: Icons.apps_outlined,
        title: 'Tools & Platforms',
        items: ['Azure DevOps', 'Postman', 'Swagger', 'MSSQL'],
      ),
      SkillCategory(
        icon: Icons.edit_note_outlined,
        title: 'Analysis & Documentation',
        items: [
          'Requirement Analysis',
          'Use Case Writing',
          'UAT',
          'Business Rules',
          'Technical Documentation',
        ],
      ),
      SkillCategory(
        icon: Icons.sync_alt_outlined,
        title: 'Integration & Testing',
        items: [
          'REST API',
          'JSON',
          'XML',
          'SQL Script',
          'API Test & Analysis',
          'Regression Testing',
          'Functional Test Design',
        ],
      ),
      SkillCategory(
        icon: Icons.insights_outlined,
        title: 'Process & Reporting',
        items: [
          'Process Improvement',
          'Data Analysis & Reporting',
          'Notification & Integration Processes',
        ],
      ),
    ],
    experiences: [
      ExperienceItem(
        company: 'Burgan Bank',
        role: 'Teknik Analiz Uzmanı',
        period: 'May 2023 - Halen',
        highlights: [
          'Bildirim süreçlerinin uçtan uca analiz ve geliştirme faaliyetlerinde aktif rol alıyorum.',
          'API entegrasyon projelerinde iş birimleri ile teknik ekipler arasında köprü görevi üstleniyorum.',
          'MSSQL ile regresyon testlerini kurguluyor ve test senaryoları hazırlıyorum.',
          'SMS, mail ve push notification süreçlerinde iyileştirme çalışmaları yürütüyorum.',
          'Süreç akışlarını optimize ederek teslim süresi, stabilite ve operasyonel verimlilik tarafında katkı sağlıyorum.',
        ],
      ),
      ExperienceItem(
        company: 'incehesap.com',
        role: 'Şikayetvar Uzmanı',
        period: 'Eylül 2022 - Mayıs 2023',
        highlights: [
          'Şikayet çözüm süreçlerini yöneterek ortalama dönüş ve çözüm süresinin iyileştirilmesine katkı sağladım.',
          'Teknik ve lojistik ekiplerle koordineli çalışarak tekrar eden problemleri analiz ettim.',
          'Süreç geliştirme önerileri oluşturarak müşteri memnuniyetine katkıda bulundum.',
        ],
      ),
      ExperienceItem(
        company: 'Cloudyflex',
        role: 'Proje Stajyeri',
        period: 'Temmuz 2022 - Ağustos 2022',
        highlights: [
          'Eğitim ve etkinlik süreçlerinin planlanmasına destek oldum.',
          'CRM üzerinde müşteri etkileşimi yönetimi süreçlerine katkı sağladım.',
          'Operasyonel iş yükünün azaltılmasına destek verdim.',
        ],
      ),
    ],
    projects: [
      ProjectItem(
        title: 'ChawaiiArcana',
        description:
            'TypeScript ile geliştirdiğim arayüz ve uygulama mantığı odaklı GitHub projem.',
        tags: ['TypeScript', 'Frontend', 'GitHub'],
        url: 'https://github.com/Scourge14/ChawaiiArcana',
      ),
      ProjectItem(
        title: 'KahveUI',
        description:
            'Kahve temalı sade, görsel odaklı ve HTML tabanlı kullanıcı arayüzü çalışması.',
        tags: ['HTML', 'UI', 'Web'],
        url: 'https://github.com/Scourge14/KahveUI',
      ),
      ProjectItem(
        title: 'WW-Collections',
        description:
            'JavaScript ile geliştirilmiş koleksiyon ve arayüz odaklı web projesi.',
        tags: ['JavaScript', 'Web', 'Collections'],
        url: 'https://github.com/Scourge14/WW-Collections',
      ),
    ],
  );

  static const _en = AppTexts(
    language: AppLanguage.en,
    menuAbout: 'About',
    menuSkills: 'Skills',
    menuProjects: 'Projects',
    menuExperience: 'Experience',
    menuContact: 'Contact',
    heroEyebrow: 'Technical Analysis Specialist',
    heroTitle:
        'Technical analyst focused on banking technologies, API integrations and process analysis.',
    heroDescription:
        'I transform business needs into practical technical solutions across notification processes, system integrations, test scenarios and technical documentation.',
    heroPrimaryCta: 'View Projects',
    heroCvCta: 'Download CV',
    heroSecondaryCta: 'Contact Me',
    panelTitle: 'Notification & API Flow',
    panelSubtitle: 'Requirement to validated integration',
    panelMetricOne: 'API',
    panelMetricTwo: 'MSSQL',
    panelMetricThree: 'UAT',
    aboutEyebrow: 'About',
    aboutTitle:
        'An analytical technical analysis practice turning banking technology needs into clear implementation flows.',
    aboutBody:
        'I have been working as a technical analyst in banking and technology for nearly 3 years. I focus on notification processes, API integrations, data analysis, test scenario design and process improvement. I work with tools such as Azure DevOps, MSSQL, Postman and Swagger to support technical requirement analysis, business rule documentation, regression testing, integration validation and production coordination.',
    aboutStats: [
      'Nearly 3 years of experience',
      'Notification processes',
      'API integrations',
      'Regression and UAT',
    ],
    skillsEyebrow: 'Skills',
    skillsTitle:
        'A focused toolkit for technical analysis, integration and testing.',
    skillsDescription:
        'The skill set is organized around the workflows it supports: analysis, documentation, integration, testing, process improvement and reporting.',
    caseStudyEyebrow: 'Case Study',
    caseStudyTitle: 'My workflow for analyzing an API integration.',
    caseStudyDescription:
        'Aligned with my CV experience, I use a clear and measurable analysis approach that turns business needs into technical requirements.',
    caseStudySteps: [
      'Clarify business needs and rules',
      'Analyze endpoint, request-response and error scenarios',
      'Validate through Postman/Swagger and prepare test scenarios',
      'Document, track and coordinate UAT through Azure DevOps',
    ],
    projectsEyebrow: 'Projects',
    projectsTitle:
        'Technical analysis workstreams aligned with my CV experience.',
    projectsDescription: 'Featured projects published on my GitHub profile.',
    projectDetails: 'Open on GitHub',
    projectDemo: 'Live Demo',
    experienceEyebrow: 'Experience',
    experienceTitle:
        'End-to-end experience across banking, e-commerce operations and project processes.',
    contactEyebrow: 'Contact',
    contactTitle: 'Let’s talk about new ideas, flows, and product needs.',
    contactDescription: 'Reach me directly through LinkedIn, GitHub or e-mail.',
    email: 'E-mail',
    linkedin: 'LinkedIn',
    github: 'GitHub',
    footerText: '© 2026 Emre Can Karacaağaçlı. All rights reserved.',
    skillCategories: [
      SkillCategory(
        icon: Icons.apps_outlined,
        title: 'Tools & Platforms',
        items: ['Azure DevOps', 'Postman', 'Swagger', 'MSSQL'],
      ),
      SkillCategory(
        icon: Icons.edit_note_outlined,
        title: 'Analysis & Documentation',
        items: [
          'Requirement Analysis',
          'Use Case Writing',
          'UAT',
          'Business Rules',
          'Technical Documentation',
        ],
      ),
      SkillCategory(
        icon: Icons.sync_alt_outlined,
        title: 'Integration & Testing',
        items: [
          'REST API',
          'JSON',
          'XML',
          'SQL Script',
          'API Test & Analysis',
          'Regression Testing',
          'Functional Test Design',
        ],
      ),
      SkillCategory(
        icon: Icons.insights_outlined,
        title: 'Process & Reporting',
        items: [
          'Process Improvement',
          'Data Analysis & Reporting',
          'Notification & Integration Processes',
        ],
      ),
    ],
    experiences: [
      ExperienceItem(
        company: 'Burgan Bank',
        role: 'Technical Analysis Specialist',
        period: 'May 2023 - Present',
        highlights: [
          'I actively contribute to end-to-end analysis and improvement activities for notification processes.',
          'I act as a bridge between business units and technical teams in API integration projects.',
          'I design regression test scenarios using MSSQL.',
          'I work on improvements for SMS, email and push notification processes.',
          'I contribute to delivery speed, stability and operational efficiency by optimizing process flows.',
        ],
      ),
      ExperienceItem(
        company: 'incehesap.com',
        role: 'Customer Complaint Specialist',
        period: 'September 2022 - May 2023',
        highlights: [
          'Managed customer complaint resolution processes and contributed to improving response and resolution times.',
          'Worked with technical and logistics teams to analyze recurring problems.',
          'Supported customer satisfaction through process improvement suggestions.',
        ],
      ),
      ExperienceItem(
        company: 'Cloudyflex',
        role: 'Project Intern',
        period: 'July 2022 - August 2022',
        highlights: [
          'Supported planning processes for training and event operations.',
          'Contributed to customer interaction management through CRM.',
          'Helped reduce operational workload.',
        ],
      ),
    ],
    projects: [
      ProjectItem(
        title: 'ChawaiiArcana',
        description:
            'A TypeScript project focused on interface work and application logic.',
        tags: ['TypeScript', 'Frontend', 'GitHub'],
        url: 'https://github.com/Scourge14/ChawaiiArcana',
      ),
      ProjectItem(
        title: 'KahveUI',
        description:
            'A coffee-themed, visual and HTML-based user interface study.',
        tags: ['HTML', 'UI', 'Web'],
        url: 'https://github.com/Scourge14/KahveUI',
      ),
      ProjectItem(
        title: 'WW-Collections',
        description:
            'A JavaScript web project focused on collections and interface structure.',
        tags: ['JavaScript', 'Web', 'Collections'],
        url: 'https://github.com/Scourge14/WW-Collections',
      ),
    ],
  );
}
