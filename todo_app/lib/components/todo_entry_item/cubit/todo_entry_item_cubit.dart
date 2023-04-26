import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/use_cases/load_todo_entry.dart';

part 'todo_entry_item_state.dart';

class ToDoEntryItemCubit extends Cubit<ToDoEntryItemState> {
  final EntryId entryId;
  final CollectionId collectionId;
  final LoadToDoEntry loadToDoEntry;
  ToDoEntryItemCubit(
      {required this.entryId,
      required this.collectionId,
      required this.loadToDoEntry})
      : super(ToDoEntryItemLoadingState());

  Future<void> fetch() async {
    try {
      final entry = await loadToDoEntry(
        ToDoEntryIdsParam(
          collectionId: collectionId,
          entryId: entryId,
        ),
      );
      return entry.fold((left) => emit(ToDoEntryItemErrorState()),
          (right) => emit(ToDoEntryItemLoadedState(toDoEntry: right)));
    } on Exception catch (_) {
      emit(ToDoEntryItemErrorState());
    }
  }
}
