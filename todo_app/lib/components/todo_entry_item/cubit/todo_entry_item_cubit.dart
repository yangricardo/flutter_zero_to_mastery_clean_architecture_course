import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';

part 'todo_entry_item_state.dart';

class ToDoEntryItemCubit extends Cubit<ToDoEntryItemState> {
  ToDoEntryItemCubit() : super(ToDoEntryItemLoadingState());
}
