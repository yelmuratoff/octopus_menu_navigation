import 'package:flutter/material.dart';

class CommonBody extends StatelessWidget {
  const CommonBody({
    super.key,
    required this.title,
    this.onPressed,
    this.onPressed2,
  });

  final String title;
  final VoidCallback? onPressed;
  final VoidCallback? onPressed2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Tap'),
            ),
            ElevatedButton(
              onPressed: onPressed2,
              child: const Text('Tap2'),
            ),
          ],
        ),
      ),
    );
  }
}
