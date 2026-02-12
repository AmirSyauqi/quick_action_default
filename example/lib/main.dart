import 'package:flutter/material.dart';
import 'package:quick_action_default/quick_action_default.dart';

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
          title: const Text('quick_action_default example'),
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
            QuickActionDefault(
              actions: [
                QuickActionItem(
                  title: 'Explore',
                  icon: Icons.explore,
                  onTap: () => _showToast(context, 'Explore tapped'),
                ),
                QuickActionItem(
                  title: 'Favorites',
                  icon: Icons.favorite,
                  onTap: () => _showToast(context, 'Favorites tapped'),
                ),
                QuickActionItem(
                  title: 'History',
                  icon: Icons.history,
                  onTap: () => _showToast(context, 'History tapped'),
                ),
                QuickActionItem(
                  title: 'Share',
                  icon: Icons.send,
                  onTap: () => _showToast(context, 'Share tapped'),
                ),
              ],
              variant: QuickActionsVariant.glass,
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(milliseconds: 800)),
    );
  }
}
