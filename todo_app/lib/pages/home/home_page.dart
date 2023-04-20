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
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-navigation-medium'),
                builder: (context) => AdaptiveScaffold.standardNavigationRail(
                    onDestinationSelected: (index) =>
                        debugPrint('selected $index'),
                    destinations: destinations
                        .map((config) =>
                            AdaptiveScaffold.toRailDestination(config))
                        .toList())),
          }),
        ),
      ),
    );
  }
}
