part of 'to_do_detail_cubit.dart';

abstract class ToDoDetailState extends Equatable {
  const ToDoDetailState();

  @override
  List<Object> get props => [];
}

class ToDoDetailCubitLoadingState extends ToDoDetailState {}

class ToDoDetailCubitErrorState extends ToDoDetailState {}

class ToDoDetailCubitLoadedState extends ToDoDetailState {
  const ToDoDetailCubitLoadedState({required this.entryIds});

  final List<EntryId> entryIds;

  @override
  List<Object> get props => [entryIds];
}
