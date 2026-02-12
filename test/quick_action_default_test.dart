import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quick_action_default/quick_action_default.dart';

void main() {
  testWidgets('renders action labels', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuickActionDefault(
            actions: const [
              QuickActionItem(title: 'Explore', icon: Icons.explore),
              QuickActionItem(title: 'Favorites', icon: Icons.favorite),
              QuickActionItem(title: 'History', icon: Icons.history),
              QuickActionItem(title: 'Share', icon: Icons.send),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Share'), findsOneWidget);
  });
}
