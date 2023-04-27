import 'package:equatable/equatable.dart';

class ToDoEntryModel extends Equatable {
  final String description;
  final bool isDone;
  final String id;

  const ToDoEntryModel({
    required this.id,
    required this.description,
    required this.isDone,
  });

  @override
  List<Object?> get props => [id, isDone, description];
}
