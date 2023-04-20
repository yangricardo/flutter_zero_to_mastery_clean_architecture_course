import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:todo_app/pages/dashboard/dashboard_page.dart';
import 'package:todo_app/pages/overview/overview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const tabs = [DashboardPage.pageConfig, OverviewPage.pageConfig];

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs
      .map((config) =>
          NavigationDestination(icon: Icon(config.icon), label: config.name))
      .toList();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-navigation-medium'),
                builder: (context) => AdaptiveScaffold.standardNavigationRail(
                    selectedLabelTextStyle:
                        TextStyle(color: theme.colorScheme.onBackground),
                    selectedIconTheme:
                        IconThemeData(color: theme.colorScheme.onBackground),
                    unselectedIconTheme: IconThemeData(
                        color: theme.colorScheme.onBackground.withOpacity(0.5)),
                    onDestinationSelected: (index) =>
                        debugPrint('selected $index'),
                    destinations: destinations
                        .map((config) =>
                            AdaptiveScaffold.toRailDestination(config))
                        .toList())),
          }),
          bottomNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('bottom-navigation-small'),
              builder: (context) =>
                  AdaptiveScaffold.standardBottomNavigationBar(
                destinations: destinations,
                onDestinationSelected: (index) => debugPrint('selected $index'),
              ),
            )
          }),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body-small'),
                builder: (_) => HomePage.tabs.first.child,
              ),
            },
          ),
        ),
      ),
    );
  }
}
