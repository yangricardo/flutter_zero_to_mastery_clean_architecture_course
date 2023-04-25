import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/domain/use_cases/load_todo_entry_ids_from_collection.dart';
import 'package:todo_app/pages/detail/cubit/to_do_detail_cubit.dart';
import 'package:todo_app/pages/detail/view_states/todo_detail_error.dart';
import 'package:todo_app/pages/detail/view_states/todo_detail_loaded.dart';
import 'package:todo_app/pages/detail/view_states/todo_detail_loading.dart';

class ToDoDetailPageProvider extends StatelessWidget {
  const ToDoDetailPageProvider({
    super.key,
    required this.collectionId,
  });

  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToDoDetailCubit>(
      create: (context) => ToDoDetailCubit(
        collectionId: collectionId,
        loadToDoEntryIdsForCollection: LoadToDoEntryIdsFromCollection(
          toDoRepository: RepositoryProvider.of<TodoRepository>(context),
        ),
      )..fetch(),
      child: ToDoDetailPage(
        collectionId: collectionId,
      ),
    );
  }
}

class ToDoDetailPage extends StatelessWidget {
  const ToDoDetailPage({
    super.key,
    required this.collectionId,
  });

  final CollectionId collectionId;

  static const pageConfig = PageConfig(
    icon: Icons.details_rounded,
    name: 'detail',
    child: Placeholder(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoDetailCubit, ToDoDetailState>(
      builder: (context, state) {
        if (state is ToDoDetailCubitLoadingState) {
          return const ToDoDetailLoading();
        } else if (state is ToDoDetailCubitLoadedState) {
          return ToDoDetailLoaded(
            collectionId: collectionId,
            entryIds: state.entryIds,
          );
        } else {
          return const ToDoDetailError();
        }
      },
    );
  }
}
