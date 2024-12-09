import 'package:flutter/material.dart';

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
          },
          child: const Text('Pop'),
        ),
      ),
    );
  }
}
