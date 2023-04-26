import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_todo_collection_page_state.dart';

class CreateTodoCollectionPageCubit
    extends Cubit<CreateTodoCollectionPageState> {
  CreateTodoCollectionPageCubit()
      : super(const CreateTodoCollectionPageState());

  void titleChanged(String? title) {
    emit(state.copyWith(title: title));
  }

  void colorChanged(String? color) {
    emit(state.copyWith(color: color));
  }
}
