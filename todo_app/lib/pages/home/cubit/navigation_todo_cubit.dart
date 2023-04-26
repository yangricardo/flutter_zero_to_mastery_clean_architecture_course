import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';

part 'navigation_todo_state.dart';

class NavigationTodoCubit extends Cubit<NavigationTodoState> {
  NavigationTodoCubit() : super(const NavigationTodoState());

  void selectedToDoCollectionChanged(CollectionId collectionId) {
    emit(NavigationTodoState(selectedCollectionId: collectionId));
  }
}
