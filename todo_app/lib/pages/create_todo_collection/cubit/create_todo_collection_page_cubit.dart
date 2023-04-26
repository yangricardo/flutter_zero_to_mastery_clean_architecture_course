import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/entities/todo_color_entity.dart';
import 'package:todo_app/domain/use_cases/create_todo_collection.dart';

part 'create_todo_collection_page_state.dart';

class CreateTodoCollectionPageCubit
    extends Cubit<CreateTodoCollectionPageState> {
  final CreateTodoCollection createToDoCollection;

  CreateTodoCollectionPageCubit({
    required this.createToDoCollection,
  }) : super(const CreateTodoCollectionPageState());

  void titleChanged(String? title) {
    emit(state.copyWith(title: title));
  }

  void colorChanged(String? color) {
    emit(state.copyWith(color: color));
  }

  Future<void> submit() async {
    final parsedColorIndex = int.tryParse(state.color ?? '') ?? 0;

    await createToDoCollection.call(ToDoCollectionParams(
      collection: ToDoCollection.empty().copyWith(
        title: state.title,
        color: ToDoColor(colorIndex: parsedColorIndex),
      ),
    ));
  }
}
