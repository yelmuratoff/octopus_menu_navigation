import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/router/feed_scope_guard.dart';
import 'package:octopus_menu_navigation/router/guards.dart';
import 'package:octopus_menu_navigation/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = Octopus(
    routes: Routes.values,
    defaultRoute: Routes.auth,
    guards: [
      TabGuard(),
      FeedWrapperGuard(allowedScreens: {'feed, feed-wrapper', 'post'}),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Octopus Navigation',
      routerConfig: _router.config,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
    );
  }
}
