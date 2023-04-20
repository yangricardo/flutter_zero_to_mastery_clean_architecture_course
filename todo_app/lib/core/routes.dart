import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/pages/settings/settings_page.dart';
import './go_route_observer.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [GoRouteObserver()],
    initialLocation: '/home/dashboard',
    routes: [
      GoRoute(
        path: '/home/settings',
        builder: (context, state) {
          return const SettingsPage();
        },
      ),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(
                path: '/home/:tab',
                builder: (context, state) {
                  return HomePage(
                    key: state.pageKey,
                    tab: state.params['tab']!,
                  );
                })
          ]),
    ]);
