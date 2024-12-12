import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/controllers/home_controller.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/common_body.dart';
import 'package:octopus_menu_navigation/router/router.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({
    super.key,
  });

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FeedController(),
        ),
      ],
      child: Consumer<FeedController>(
        builder: (context, value, child) {
          return CommonBody(
            title: 'Feed Screen: ${value.counter}',
            onPressed: () {
              context.read<FeedController>().increment();
            },
            onPressed2: () {
              context.octopus.setArguments((args) => args['tab'] = 'home').then(
                (value) {
                  if (!context.mounted) return;
                  context.octopus.setState((state) => state
                    ..findByName('home-tab')?.add(
                      Routes.post.node(arguments: {'id': '1'}),
                    ));
                },
              );

              // print(context.octopus.state..findByName('feed'));
            },
          );
        },
      ),
    );
  }
}
