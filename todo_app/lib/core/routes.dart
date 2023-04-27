import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/pages/create_todo_collection/create_todo_collection_page.dart';
import 'package:todo_app/pages/create_todo_entry/create_todo_entry_page.dart';
import 'package:todo_app/pages/detail/todo_detail_page.dart';
import 'package:todo_app/pages/home/cubit/navigation_todo_cubit.dart';
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
        name: CreateTodoCollectionPage.pageConfig.name,
        path: '$_basePath/overview/${CreateTodoCollectionPage.pageConfig.name}',
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('create collection'),
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
          body: SafeArea(
            child: CreateTodoCollectionPage.pageConfig.child,
          ),
        ),
      ),
      GoRoute(
        name: CreateTodoEntryPage.pageConfig.name,
        path: '$_basePath/overview/${CreateTodoEntryPage.pageConfig.name}',
        builder: (context, state) {
          final castedExtras = state.extra as CreateTodoEntryPageExtra;
          return Scaffold(
            appBar: AppBar(
              title: const Text('create entry'),
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
            body: SafeArea(
              child: CreateTodoEntryPageProvider(
                collectionId: castedExtras.collectionId,
                onToDoEntryItemAdded: castedExtras.onToDoEntryItemAdded,
              ),
            ),
          );
        },
      ),
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
                  return HomePageProvider(
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
          return BlocListener<NavigationTodoCubit, NavigationTodoState>(
            listenWhen: (previous, current) =>
                previous.isSecondBodyDisplayed != current.isSecondBodyDisplayed,
            listener: (context, state) {
              if (context.canPop() && (state.isSecondBodyDisplayed ?? false)) {
                context.pop();
              }
            },
            child: Scaffold(
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
            ),
          );
        },
      )
    ]);
