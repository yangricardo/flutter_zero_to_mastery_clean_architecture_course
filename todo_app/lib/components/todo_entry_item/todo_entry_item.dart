import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/todo_entry_item/cubit/todo_entry_item_cubit.dart';
import 'package:todo_app/components/todo_entry_item/view_states/todo_entry_item_error.dart';
import 'package:todo_app/components/todo_entry_item/view_states/todo_entry_item_loaded.dart';
import 'package:todo_app/components/todo_entry_item/view_states/todo_entry_item_loading.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/domain/use_cases/load_todo_entry.dart';

class ToDoEntryItemProvider extends StatelessWidget {
  final EntryId entryId;
  final CollectionId collectionId;
  const ToDoEntryItemProvider(
      {super.key, required this.entryId, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoEntryItemCubit(
        entryId: entryId,
        collectionId: collectionId,
        loadToDoEntry: LoadToDoEntry(
            todoRepository: RepositoryProvider.of<TodoRepository>(context)),
      )..fetch(),
      child: const ToDoEntryItem(),
    );
  }
}

class ToDoEntryItem extends StatelessWidget {
  const ToDoEntryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoEntryItemCubit, ToDoEntryItemState>(
      builder: (context, state) {
        if (state is ToDoEntryItemLoadingState) {
          return const ToDoEntryItemLoading();
        } else if (state is ToDoEntryItemLoadedState) {
          return ToDoEntryItemLoaded(
            entryItem: state.toDoEntry,
            onChanged: (value) {
              context.read<ToDoEntryItemCubit>().fetch();
            },
          );
        } else {
          return const ToDoEntryItemError();
        }
      },
    );
  }
}
