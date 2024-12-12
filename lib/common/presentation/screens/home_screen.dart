import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/controllers/home_controller.dart';
import 'package:octopus_menu_navigation/common/enums/root_tabs_enum.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/common_body.dart';
import 'package:octopus_menu_navigation/router/router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) {
        return CommonBody(
          title: 'Home Screen: ${value.counter}',
          onPressed: () {
            context.octopus.setArguments((args) => args['tab'] = 'home').then(
              (value) {
                if (!context.mounted) return;
                context.octopus.setState((state) => state
                  ..findByName(RootTabsEnum.home.bucket)?.add(
                    Routes.events.node(),
                  ));
              },
            );
          },
        );
      },
    );
  }
}
