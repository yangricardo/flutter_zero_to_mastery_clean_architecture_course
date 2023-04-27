import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/form_value.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/use_cases/create_todo_entry.dart';

part 'create_todo_entry_page_state.dart';

class CreateTodoEntryPageCubit extends Cubit<CreateTodoEntryPageState> {
  final CollectionId collectionId;
  final CreateTodoEntry addToDoEntry;

  CreateTodoEntryPageCubit({
    required this.collectionId,
    required this.addToDoEntry,
  }) : super(const CreateTodoEntryPageState());

  void descriptionChanged({String? description}) {
    ValidationStatus currentStatus = ValidationStatus.pending;
    if (description == null || description.isEmpty || description.length < 2) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }
    emit(
      state.copyWith(
          description:
              FormValue(validationStatus: currentStatus, value: description)),
    );
  }

  void submit() {
    addToDoEntry.call(ToDoEntryParams(
        collectionId: collectionId,
        entry:
            ToDoEntry.empty().copyWith(description: state.description?.value)));
  }
}
