import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/router/router.dart';
import 'package:octopus_menu_navigation/widgets/common_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      title: 'Auth Screen',
      onPressed: () {
        context.octopus.setState(
          (state) => state
            ..clear()
            ..add(Routes.root.node()),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonBody(
      title: 'Home Screen',
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      title: 'Products Screen',
      onPressed: () {},
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonBody(
      title: 'Notifications Screen',
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonBody(
      title: 'Profile Screen',
    );
  }
}

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      title: 'Events Screen: $title',
    );
  }
}

class MenuPlaceholderScreen extends StatelessWidget {
  const MenuPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Placeholder Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop();
            context.octopus.maybePop();
          },
          child: const Text('Pop'),
        ),
      ),
    );
  }
}
