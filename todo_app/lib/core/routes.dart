import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/pages/detail/todo_detail_page.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/pages/overview/overview_page.dart';
import 'package:todo_app/pages/settings/settings_page.dart';
import './go_route_observer.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const _basePath = '/home';

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [GoRouteObserver()],
    initialLocation: '$_basePath/dashboard',
    routes: [
      GoRoute(
        name: SettingsPage.pageConfig.name,
        path: '$_basePath/settings',
        builder: (context, state) {
          return const SettingsPage();
        },
      ),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
                name: HomePage.pageConfig.name,
                path: '$_basePath/:tab',
                builder: (context, state) {
                  return HomePage(
                    key: state.pageKey,
                    tab: state.params['tab']!,
                  );
                })
          ]),
      GoRoute(
        path: '$_basePath/overview/:collectionId',
        name: ToDoDetailPage.pageConfig.name,
        builder: (context, state) {
          final collectionId = CollectionId.fromUniqueString(
            state.params['collectionId'] ?? '',
          );
          return Scaffold(
            appBar: AppBar(
              title: Text('Collection ${collectionId.value}'),
              leading: BackButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.goNamed(
                      HomePage.pageConfig.name,
                      params: {'tab': OverviewPage.pageConfig.name},
                    );
                  }
                },
              ),
            ),
            body: ToDoDetailPageProvider(
              collectionId: collectionId,
            ),
          );
        },
      )
    ]);
