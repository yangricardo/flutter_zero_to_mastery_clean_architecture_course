part of 'todo_overview_cubit.dart';

abstract class TodoOverviewState extends Equatable {
  const TodoOverviewState();

  @override
  List<Object> get props => [];
}

class ToDoOverviewLoadingState extends TodoOverviewState {}

class ToDoOverviewErrorState extends TodoOverviewState {}

class ToDoOverviewLoadedState extends TodoOverviewState {
  final List<ToDoCollection> collections;

  const ToDoOverviewLoadedState({required this.collections});

  @override
  List<Object> get props => [collections];
}
