import 'package:equatable/equatable.dart';
import 'package:todo_app/data/data_sources/models/todo_entry_model.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';

class ToDoEntry extends Equatable {
  final String description;
  final bool isDone;
  final EntryId id;

  const ToDoEntry({
    required this.id,
    required this.description,
    required this.isDone,
  });

  factory ToDoEntry.empty() {
    return ToDoEntry(
      id: EntryId(),
      description: '',
      isDone: false,
    );
  }

  ToDoEntry copyWith({
    String? description,
    bool? isDone,
  }) {
    return ToDoEntry(
      id: id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, isDone, description];

  static toToDoEntryModel(ToDoEntry entry) {
    return ToDoEntryModel(
      id: entry.id.value,
      description: entry.description,
      isDone: entry.isDone,
    );
  }
}
