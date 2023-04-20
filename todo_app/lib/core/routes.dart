import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          return Container(color: Colors.amber);
        },
      ),
      GoRoute(
        path: '/home/start',
        builder: (context, state) {
          return Container(color: Colors.blue);
        },
      )
    ]);
