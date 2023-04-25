import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_overview_state.dart';

class TodoOverviewCubit extends Cubit<TodoOverviewState> {
  TodoOverviewCubit() : super(TodoOverviewInitial());
}
