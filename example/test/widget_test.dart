import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quick_action_default_example/main.dart';

void main() {
  testWidgets('Example app renders quick actions', (WidgetTester tester) async {
    await tester.pumpWidget(const ExampleApp());
    await tester.pumpAndSettle();

    expect(find.text('quick_action_default example'), findsOneWidget);
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Share'), findsOneWidget);
  });

  testWidgets('Theme mode toggle button is shown', (WidgetTester tester) async {
    await tester.pumpWidget(const ExampleApp());
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);
  });
}
