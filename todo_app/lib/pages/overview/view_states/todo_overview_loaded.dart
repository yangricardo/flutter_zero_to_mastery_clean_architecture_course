import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/pages/create_todo_collection/create_todo_collection_page.dart';
import 'package:todo_app/pages/detail/todo_detail_page.dart';
import 'package:todo_app/pages/home/cubit/navigation_todo_cubit.dart';
import 'package:todo_app/pages/overview/cubit/todo_overview_cubit.dart';

class ToDoOverviewLoaded extends StatelessWidget {
  final List<ToDoCollection> collections;
  const ToDoOverviewLoaded({super.key, required this.collections});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: collections.length,
          itemBuilder: (context, index) {
            final item = collections[index];
            final colorScheme = Theme.of(context).colorScheme;
            return ListTile(
              tileColor: colorScheme.surface,
              selectedTileColor: colorScheme.surfaceVariant,
              iconColor: item.color.color,
              selectedColor: item.color.color,
              onTap: () {
                context
                    .read<NavigationTodoCubit>()
                    .selectedToDoCollectionChanged(item.id);
                if (Breakpoints.small.isActive(context)) {
                  context.pushNamed(
                    ToDoDetailPage.pageConfig.name,
                    params: {'collectionId': item.id.value},
                  );
                }
              },
              leading: const Icon(Icons.circle),
              title: Text(item.title),
            );
          },
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  heroTag: 'create-todo-collection-fab-hero-tag',
                  key: const Key('create-todo-collection-fab'),
                  onPressed: () {
                    context
                        .pushNamed(CreateTodoCollectionPage.pageConfig.name)
                        .then((value) {
                      if (value != null) {
                        context.read<TodoOverviewCubit>().readToDoCollections();
                      }
                    });
                  },
                  child: Icon(CreateTodoCollectionPage.pageConfig.icon)),
            ))
      ],
    );
  }
}
