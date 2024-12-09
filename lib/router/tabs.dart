import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';

/// RootTabsEnum enumeration
enum RootTabsEnum implements Comparable<RootTabsEnum> {
  home('home'),
  products('products'),
  menu('menu'),
  notifications('notifications'),
  profile('profile');

  const RootTabsEnum(this.name);

  /// Creates a new instance of [RootTabsEnum] from a given string.
  static RootTabsEnum fromValue(String? value, {RootTabsEnum? fallback}) =>
      switch (value?.trim().toLowerCase()) {
        'home' => home,
        'products' => products,
        'menu' => menu,
        'notifications' => notifications,
        'profile' => profile,
        _ => fallback ?? (throw ArgumentError.value(value)),
      };

  /// Value of the enum
  final String name;

  /// Pattern matching
  T map<T>({
    required T Function() home,
    required T Function() products,
    required T Function() menu,
    required T Function() notifications,
    required T Function() profile,
  }) =>
      switch (this) {
        RootTabsEnum.home => home(),
        RootTabsEnum.products => products(),
        RootTabsEnum.menu => menu(),
        RootTabsEnum.notifications => notifications(),
        RootTabsEnum.profile => profile(),
      };

  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? home,
    T Function()? products,
    T Function()? menu,
    T Function()? notifications,
    T Function()? profile,
  }) =>
      map<T>(
        home: home ?? orElse,
        products: products ?? orElse,
        menu: menu ?? orElse,
        notifications: notifications ?? orElse,
        profile: profile ?? orElse,
      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? home,
    T Function()? products,
    T Function()? menu,
    T Function()? notifications,
    T Function()? profile,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        home: home,
        products: products,
        menu: menu,
        notifications: notifications,
        profile: profile,
      );

  @override
  int compareTo(RootTabsEnum other) => index.compareTo(other.index);

  @override
  String toString() => name;
}

// <--- Home tab --->

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: '${RootTabsEnum.home}-tab',
      );
}

// <--- Products tab --->

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: '${RootTabsEnum.products}-tab',
      );
}

// <--- Menu tab --->

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: '${RootTabsEnum.menu}-tab',
        shouldHandleBackButton: (context) => true,
        onBackButtonPressed: (context, navigator) async {
          debugPrint('Menu tab back button pressed');
          return true;
        },
      );
}

// <--- Notifications tab --->

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: '${RootTabsEnum.notifications}-tab',
      );
}

// <--- Profile tab --->

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: '${RootTabsEnum.profile}-tab',
      );
}
