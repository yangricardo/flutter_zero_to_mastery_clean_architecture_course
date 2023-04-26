import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/pages/create_todo_collection/create_todo_collection_page.dart';
import 'package:todo_app/pages/dashboard/dashboard_page.dart';
import 'package:todo_app/pages/detail/todo_detail_page.dart';
import 'package:todo_app/pages/home/cubit/navigation_todo_cubit.dart';
import 'package:todo_app/pages/overview/overview_page.dart';
import 'package:todo_app/pages/settings/settings_page.dart';
import 'package:todo_app/pages/task/task_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere((element) => element.name == tab);

  final int index;

  static const pageConfig = PageConfig(
    icon: Icons.home_rounded,
    name: 'home',
  );

  static const tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
    TaskPage.pageConfig
  ];

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs
      .map((config) =>
          NavigationDestination(icon: Icon(config.icon), label: config.name))
      .toList();

  void _tapOnNavigationDestination(BuildContext context, int index) =>
      context.goNamed(HomePage.pageConfig.name,
          params: {'tab': HomePage.tabs[index].name});

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
                    leading: IconButton(
                        onPressed: () {
                          context.pushNamed(
                              CreateTodoCollectionPage.pageConfig.name);
                        },
                        icon: Icon(CreateTodoCollectionPage.pageConfig.icon)),
                    trailing: IconButton(
                        onPressed: () =>
                            context.pushNamed(SettingsPage.pageConfig.name),
                        icon: Icon(SettingsPage.pageConfig.icon)),
                    selectedLabelTextStyle:
                        TextStyle(color: theme.colorScheme.onBackground),
                    selectedIconTheme:
                        IconThemeData(color: theme.colorScheme.onBackground),
                    unselectedIconTheme: IconThemeData(
                        color: theme.colorScheme.onBackground.withOpacity(0.5)),
                    onDestinationSelected: (value) =>
                        _tapOnNavigationDestination(context, value),
                    selectedIndex: widget.index,
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
                currentIndex: widget.index,
                onDestinationSelected: (value) =>
                    _tapOnNavigationDestination(context, value),
              ),
            )
          }),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body-small'),
                builder: (_) => HomePage.tabs[widget.index].child,
              ),
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('secondary-body-medium'),
                builder: widget.index != 1
                    ? null
                    : (_) =>
                        BlocBuilder<NavigationTodoCubit, NavigationTodoState>(
                          builder: (context, state) {
                            final selectedId = state.selectedCollectionId;
                            final isSecondBodyDisplayed =
                                Breakpoints.mediumAndUp.isActive(context);

                            context
                                .read<NavigationTodoCubit>()
                                .secondBodyHasChanged(
                                  isSecondBodyDisplayed: isSecondBodyDisplayed,
                                );

                            if (selectedId == null) {
                              return const Placeholder();
                            }
                            return ToDoDetailPageProvider(
                              key: Key(selectedId.value),
                              collectionId: selectedId,
                            );
                          },
                        ),
              ),
            },
          ),
        ),
      ),
    );
  }
}
