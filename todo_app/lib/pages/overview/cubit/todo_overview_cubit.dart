import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/use_cases/load_todo_collection.dart';

part 'todo_overview_state.dart';

class TodoOverviewCubit extends Cubit<TodoOverviewState> {
  final LoadToDoCollections loadToDoCollections;
  TodoOverviewCubit({
    required this.loadToDoCollections,
    TodoOverviewState? initialState,
  }) : super(initialState ?? ToDoOverviewLoadingState());

  Future<void> readToDoCollections() async {
    emit(ToDoOverviewLoadingState());
    try {
      final collections = await loadToDoCollections.call(NoParams());
      if (collections.isLeft) {
        emit(ToDoOverviewErrorState());
      } else {
        emit(ToDoOverviewLoadedState(collections: collections.right));
      }
    } on Exception {
      emit(ToDoOverviewErrorState());
    }
  }
}
