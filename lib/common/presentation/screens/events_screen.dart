import 'package:flutter/material.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/common_body.dart';

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
