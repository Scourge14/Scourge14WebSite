import 'package:emre_can_portfolio/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('portfolio renders hero and language toggle', (tester) async {
    await tester.pumpWidget(const EmreCanPortfolioApp());

    expect(find.text('Emre Can'), findsWidgets);
    expect(find.textContaining('Bankacılık teknolojileri'), findsOneWidget);
    expect(find.text('CV İndir'), findsOneWidget);
    expect(find.text('TR'), findsOneWidget);
    expect(find.text('EN'), findsOneWidget);

    await tester.tap(find.text('EN'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Technical analyst focused'), findsOneWidget);
    expect(find.text('Download CV'), findsOneWidget);
  });

  testWidgets('theme toggle switches to dark mode', (tester) async {
    await tester.pumpWidget(const EmreCanPortfolioApp());

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.themeMode, ThemeMode.light);

    await tester.tap(find.byIcon(Icons.dark_mode_outlined));
    await tester.pumpAndSettle();

    final updatedMaterialApp = tester.widget<MaterialApp>(
      find.byType(MaterialApp),
    );
    expect(updatedMaterialApp.themeMode, ThemeMode.dark);
  });

  testWidgets('mobile hero and contact render without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const EmreCanPortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('CV İndir'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.scrollUntilVisible(
      find.text('Yeni fikirleri, akışları ve ürün ihtiyaçlarını konuşalım.'),
      700,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    expect(
      find.text('Yeni fikirleri, akışları ve ürün ihtiyaçlarını konuşalım.'),
      findsOneWidget,
    );
    expect(find.text('LinkedIn'), findsWidgets);
    expect(find.text('GitHub'), findsWidgets);
    expect(find.text('E-posta'), findsWidgets);
    expect(tester.takeException(), isNull);
  });
}
