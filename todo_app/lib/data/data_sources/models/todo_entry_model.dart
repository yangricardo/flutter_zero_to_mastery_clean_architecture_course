import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';

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

  factory ToDoEntryModel.fromJson(Map<String, dynamic> json) =>
      _$ToDoEntryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoEntryModelToJson(this);

  static toToDoEntry(ToDoEntryModel entry) {
    return ToDoEntry(
      id: EntryId.fromUniqueString(entry.id),
      description: entry.description,
      isDone: entry.isDone,
    );
  }
}
