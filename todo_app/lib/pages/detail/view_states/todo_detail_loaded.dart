import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/components/todo_entry_item/todo_entry_item.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/pages/create_todo_entry/create_todo_entry_page.dart';
import 'package:todo_app/pages/detail/cubit/to_do_detail_cubit.dart';

class ToDoDetailLoaded extends StatelessWidget {
  const ToDoDetailLoaded({
    super.key,
    required this.collectionId,
    required this.entryIds,
  });

  final List<EntryId> entryIds;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: entryIds.length,
              itemBuilder: (context, index) {
                return ToDoEntryItemProvider(
                  entryId: entryIds[index],
                  collectionId: collectionId,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    heroTag: 'create-todo-entry-fab-hero-tag',
                    key: const Key('create-todo-entry-fab'),
                    onPressed: () {
                      context
                          .pushNamed(CreateTodoEntryPage.pageConfig.name,
                              extra: CreateTodoEntryPageExtra(
                                collectionId: collectionId,
                                onToDoEntryItemAdded:
                                    context.read<ToDoDetailCubit>().fetch,
                              ))
                          .then((value) {
                        if (value != null) {
                          context.read<ToDoDetailCubit>().fetch();
                        }
                      });
                    },
                    child: Icon(CreateTodoEntryPage.pageConfig.icon)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
