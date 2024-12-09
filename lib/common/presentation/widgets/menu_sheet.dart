import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/enums/root_tabs_enum.dart';
import 'package:octopus_menu_navigation/router/router.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/bottom_bar.dart';

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({super.key, this.onItemTapped});

  final void Function(int)? onItemTapped;

  static Future<Object?> show(
    BuildContext context, {
    required void Function(int) onItemTapped,
  }) async {
    return await showModalBottomSheet(
      context: context,
      useRootNavigator: false,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => MenuBottomSheet(
        onItemTapped: onItemTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Events'),
          onTap: () async {
            Navigator.of(context).pop();

            context.octopus.setArguments((args) => args['tab'] = 'menu').then(
              (value) {
                if (!context.mounted) return;
                context.octopus.setState((state) => state
                  ..findByName(RootTabsEnum.menu.bucket)?.add(
                    Routes.events.node(),
                  ));
              },
            );
          },
        ),
        BottomBar(
          currentIndex: 2,
          onItemTapped: (index) {
            onItemTapped?.call(index);
          },
        ),
      ],
    );
  }
}
