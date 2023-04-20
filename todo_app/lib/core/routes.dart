import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/views/settings_view.dart';
import 'package:todo_app/core/views/start_view.dart';
import 'package:todo_app/core/views/task_view.dart';
import 'package:todo_app/pages/home/home_page.dart';
import './go_route_observer.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [GoRouteObserver()],
    initialLocation: '/home/dashboard',
    routes: [
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
      GoRoute(
        path: '/home/settings',
        builder: (context, state) {
          return const SettingsView();
        },
      ),
      GoRoute(
        path: '/home/start',
        builder: (context, state) {
          return const StartView();
        },
      ),
      GoRoute(
        path: '/home/task',
        builder: (context, state) {
          return const TaskView();
        },
      )
    ]);
