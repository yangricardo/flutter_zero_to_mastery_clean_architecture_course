import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_entry_model.g.dart';

@JsonSerializable()
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
