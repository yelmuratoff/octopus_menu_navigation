import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/router/router.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/common_body.dart';

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
