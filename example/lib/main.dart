import 'package:flutter/material.dart';
import 'package:quick_action_default/quick_action_default.dart';
import 'package:amicons/amicons.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  ThemeMode mode = ThemeMode.light;
  List<QuickActionItem> actionList = [
    QuickActionItem(
      title: 'Explore',
      icon: Amicons.iconly_discovery_fill,
      onTap: () => debugPrint('Explore tapped'),
    ),
    QuickActionItem(
      title: 'Favorites',
      icon: Amicons.iconly_heart_fill,
      onTap: () => debugPrint('Favorites tapped'),
    ),
    QuickActionItem(
      title: 'History',
      icon: Amicons.iconly_paper_fill,
      onTap: () => debugPrint('History tapped'),
    ),
    QuickActionItem(
      title: 'Share',
      icon: Amicons.iconly_send,
      onTap: () => debugPrint('Share tapped'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: mode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  mode = mode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
                });
              },
              icon: Icon(
                mode == ThemeMode.light
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          children: [
            // Filled Quick Action
            const _SectionTitle(title: 'Quick Action - Filled'),
            SizedBox(height: 8),
            QuickActionDefault(
              actions: actionList,
              variant: QuickActionsVariant.filled,
            ),
            const SizedBox(height: 26),

            // Outlined Quick Action
            const _SectionTitle(title: 'Quick Action - Outlined'),
            SizedBox(height: 8),
            QuickActionDefault(
              actions: actionList,
              variant: QuickActionsVariant.outlined,
            ),
            const SizedBox(height: 26),

            // Glass Quick Action
            const _SectionTitle(title: 'Quick Action - Glass'),
            SizedBox(height: 8),
            QuickActionDefault(
              actions: actionList,
              variant: QuickActionsVariant.glass,
            ),
            const SizedBox(height: 26),

            // Custom Colored Quick Action
            const _SectionTitle(title: 'Quick Action - Custom(Outlined)'),
            SizedBox(height: 8),
            QuickActionDefault(
              actions: actionList,
              variant: QuickActionsVariant.outlined,
              iconColor: Colors.deepOrange,
              textColor: Colors.deepOrange,
              outlineColor: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: scheme.onSurface,
        ),
      ),
    );
  }
}
