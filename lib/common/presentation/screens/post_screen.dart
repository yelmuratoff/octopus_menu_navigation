import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/common_body.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    this.id,
    super.key,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return CommonBody(
      title: 'Post Screen: Id: $id\nCounter:',
      onPressed: () {
        debugPrint('Tree: \n${context.octopus.state}');
      },
    );
  }
}
