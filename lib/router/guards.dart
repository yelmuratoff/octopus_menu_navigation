import 'dart:async';

import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/router/router.dart';
import 'package:octopus_menu_navigation/router/tabs.dart';

/// Do not allow any nested routes at `root` inderectly except of `*-tab`.
class TabGuard extends OctopusGuard {
  TabGuard();

  static final _homeTab = '${RootTabsEnum.home.name}-tab';
  static final _productsTab = '${RootTabsEnum.products.name}-tab';
  static final _menuTab = '${RootTabsEnum.menu.name}-tab';
  static final _notificationsTab = '${RootTabsEnum.notifications.name}-tab';
  static final _profileTab = '${RootTabsEnum.profile.name}-tab';

  String currentTab = _homeTab;
  String previousTab = _homeTab;

  @override
  FutureOr<OctopusState> call(
    List<OctopusHistoryEntry> history,
    OctopusState$Mutable state,
    Map<String, Object?> context,
  ) {
    // <--- Tabs --->

    currentTab = state.arguments['tab'] ?? _homeTab;

    final root = state.findByName(Routes.root.name);

    /// Do nothing if `root` not found.
    if (root == null) return state;

    // Remove all nested routes except of `*-tab`.
    root.removeWhere(
      (node) =>
          node.name != _homeTab &&
          node.name != _profileTab &&
          node.name != _productsTab &&
          node.name != _menuTab &&
          node.name != _notificationsTab,
      recursive: false,
    );

    // <--- Home tab node --->

    // Upsert home tab node if not exists.
    final home =
        root.putIfAbsent(_homeTab, () => OctopusNode.mutable(_homeTab));
    if (!home.hasChildren) {
      home.add(OctopusNode.mutable(Routes.home.name));
    }

    // <--- Products tab node --->

    // Upsert products tab node if not exists.
    final products =
        root.putIfAbsent(_productsTab, () => OctopusNode.mutable(_productsTab));
    if (!products.hasChildren) {
      products.add(OctopusNode.mutable(Routes.products.name));
    }

    // <--- Menu tab node --->

    // Upsert menu tab node if not exists.
    final menu =
        root.putIfAbsent(_menuTab, () => OctopusNode.mutable(_menuTab));
    if (!menu.hasChildren) {
      menu.add(OctopusNode.mutable(Routes.menu.name));
    }

    // <--- Notifications tab node --->

    // Upsert notifications tab node if not exists.
    final notifications = root.putIfAbsent(
        _notificationsTab, () => OctopusNode.mutable(_notificationsTab));
    if (!notifications.hasChildren) {
      notifications.add(OctopusNode.mutable(Routes.notifications.name));
    }

    // <--- Profile tab node --->

    // Upsert profile tab node if not exists.
    final profile =
        root.putIfAbsent(_profileTab, () => OctopusNode.mutable(_profileTab));
    if (!profile.hasChildren) {
      profile.add(OctopusNode.mutable(Routes.profile.name));
    }

    return state;
  }
}
