import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_todo_collection_page_state.dart';

class CreateTodoCollectionPageCubit extends Cubit<CreateTodoCollectionPageState> {
  CreateTodoCollectionPageCubit() : super(CreateTodoCollectionPageInitial());
}
