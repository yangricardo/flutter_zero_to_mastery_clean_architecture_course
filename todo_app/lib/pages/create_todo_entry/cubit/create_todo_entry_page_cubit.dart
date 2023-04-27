import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_todo_entry_page_state.dart';

class CreateTodoEntryPageCubit extends Cubit<CreateTodoEntryPageState> {
  CreateTodoEntryPageCubit() : super(const CreateTodoEntryPageState());
}
