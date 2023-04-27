import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';

part 'create_todo_entry_page_state.dart';

class CreateTodoEntryPageCubit extends Cubit<CreateTodoEntryPageState> {
  final CollectionId collectionId;

  CreateTodoEntryPageCubit({required this.collectionId})
      : super(const CreateTodoEntryPageState());
}
