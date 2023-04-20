import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/views/settings_view.dart';
import 'package:todo_app/core/views/start_view.dart';
import './go_route_observer.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [GoRouteObserver()],
    initialLocation: '/home/start',
    routes: [
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
      )
    ]);
