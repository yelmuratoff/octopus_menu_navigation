import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/enums/root_tabs_enum.dart';
import 'package:octopus_menu_navigation/router/tabs.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/bottom_bar.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/menu_sheet.dart';

/// The root page of the application.
class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key ?? const ValueKey<String>('RootScreen'));

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  // Octopus state observer
  late final OctopusStateObserver _octopusStateObserver;

  // Current tab
  RootTabsEnum _tab = RootTabsEnum.home;
  RootTabsEnum _previousTab = RootTabsEnum.home;
  Map<String, dynamic>? _lastArguments;

  @override
  void initState() {
    super.initState();
    _octopusStateObserver = context.octopus.observer;

    // Restore tab from router arguments
    _tab = RootTabsEnum.fromValue(
      _octopusStateObserver.value.arguments['tab'],
      fallback: RootTabsEnum.home,
    );
    _octopusStateObserver.addListener(_onOctopusStateChanged);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NoAnimationScope(
          child: IndexedStack(
            index: _tab.index,
            children: const [
              HomeTab(),
              ProductsTab(),
              MenuTab(),
              NotificationsTab(),
              ProfileTab(),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: _tab.index,
          onItemTapped: _onItemTapped,
        ),
      );

  // <--- Methods --->

  // Bottom navigation bar item tapped
  void _onItemTapped(int index) {
    final menuTab = _octopusStateObserver.value.findByName(RootTabsEnum.menu.bucket);
    if (menuTab == null) return;

    final nextTab = RootTabsEnum.values[index];

    if (menuTab.children.length <= 1 && nextTab == RootTabsEnum.menu) {
      // Open menu
      _showMenu();
    } else {
      if (_tab == RootTabsEnum.menu) {
        // Show menu
        _showMenu();
        return;
      }
      // Switch tab to new one
      _switchTab(nextTab);
    }
  }

  Future<Object?> _showMenu() {
    return MenuBottomSheet.show(
      context,
      onItemTapped: (index) {
        final newTab = RootTabsEnum.values[index];
        Navigator.of(context).pop();
        _switchTab(newTab);
      },
    );
  }

  // Change tab
// Change tab
  void _switchTab(RootTabsEnum tab) {
    if (!mounted) return;
    if (_tab == tab) return;

    setState(() {
      _previousTab = _tab; // Сохраняем текущую вкладку как предыдущую
      _tab = tab; // Обновляем текущую вкладку
    });

    context.octopus.setArguments((args) => args['tab'] = tab.name);
  }

// Добавим метод для возврата на предыдущую вкладку
  // ignore: unused_element
  void _switchToPreviousTab() {
    if (!mounted || _tab == _previousTab) return;

    setState(() {
      final tempTab = _tab;
      _tab = _previousTab;
      _previousTab = tempTab;
    });

    context.octopus.setArguments((args) => args['tab'] = _tab.name);
  }

  // Router state changed
  void _onOctopusStateChanged() {
    const deepEquality = DeepCollectionEquality();
    final currentArguments = _octopusStateObserver.value.arguments;
    final menuTab = _octopusStateObserver.value.findByName(RootTabsEnum.menu.bucket);
    if (menuTab == null) return;

    // Если аргументы не изменились, вероятно, это pop с другого экрана
    if (deepEquality.equals(_lastArguments, currentArguments) && _tab == RootTabsEnum.menu) {
      if (menuTab.children.length <= 1) {
        _switchToPreviousTab();
      }
      return;
    }

    _lastArguments = currentArguments;

    final newTab = RootTabsEnum.fromValue(
      currentArguments['tab'],
      fallback: RootTabsEnum.home,
    );

    _switchTab(newTab);
  }
}
