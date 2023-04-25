import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/use_cases/load_todo_entry_ids_from_collection.dart';

part 'to_do_detail_state.dart';

class ToDoDetailCubit extends Cubit<ToDoDetailState> {
  ToDoDetailCubit({
    required this.collectionId,
    required this.loadToDoEntryIdsForCollection,
  }) : super(ToDoDetailCubitLoadingState());

  final CollectionId collectionId;
  final LoadToDoEntryIdsFromCollection loadToDoEntryIdsForCollection;

  Future<void> fetch() async {
    emit(ToDoDetailCubitLoadingState());
    try {
      final entryIds = await loadToDoEntryIdsForCollection.call(
        CollectionIdParam(collectionId: collectionId),
      );

      if (entryIds.isLeft) {
        emit(ToDoDetailCubitErrorState());
      } else {
        emit(ToDoDetailCubitLoadedState(entryIds: entryIds.right));
      }
    } on Exception {
      emit(ToDoDetailCubitErrorState());
    }
  }
}
