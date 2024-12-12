import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/enums/root_tabs_enum.dart';

// <--- Home tab --->

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: RootTabsEnum.home.bucket,
      );
}

// <--- Products tab --->

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: RootTabsEnum.products.bucket,
      );
}

// <--- Menu tab --->

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: RootTabsEnum.menu.bucket,
      );
}

// <--- Notifications tab --->

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: RootTabsEnum.notifications.bucket,
      );
}

// <--- Profile tab --->

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: RootTabsEnum.profile.bucket,
      );
}
