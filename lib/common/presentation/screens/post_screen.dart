import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/controllers/home_controller.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/common_body.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    this.id,
    super.key,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedController>(builder: (context, value, child) {
      return CommonBody(
        title: 'Post | Counter: ${value.counter}',
        onPressed: () {
          debugPrint('Tree: \n${context.octopus.state}');
        },
      );
    });
  }
}
