import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/use_cases/load_todo_collection.dart';

part 'todo_overview_state.dart';

class TodoOverviewCubit extends Cubit<TodoOverviewState> {
  final LoadToDoCollections loadToDoCollections;
  TodoOverviewCubit({
    required this.loadToDoCollections,
    TodoOverviewState? initialState,
  }) : super(initialState ?? ToDoOverviewLoadingState());
}
