import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class FeedWrapper extends StatelessWidget {
  const FeedWrapper({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => FeedController(),
          ),
        ],
        child: const BucketNavigator(
          bucket: 'feed-wrapper',
        ),
      );
}
