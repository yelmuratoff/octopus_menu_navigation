import 'package:flutter/material.dart';

class CommonBody extends StatelessWidget {
  const CommonBody({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          child: const Text('Tap'),
        ),
      ),
    );
  }
}
