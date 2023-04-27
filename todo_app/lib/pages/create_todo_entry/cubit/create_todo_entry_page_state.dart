part of 'create_todo_entry_page_cubit.dart';

class CreateTodoEntryPageState extends Equatable {
  final String? description;

  const CreateTodoEntryPageState({this.description});

  CreateTodoEntryPageState copyWith({String? description}) {
    return CreateTodoEntryPageState(
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [description];
}
