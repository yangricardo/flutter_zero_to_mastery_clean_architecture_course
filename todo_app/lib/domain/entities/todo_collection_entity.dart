import 'package:todo_app/domain/entities/todo_color_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';

class ToDoCollection {
  final CollectionId id;
  final String title;
  final ToDoColor color;

  ToDoCollection({
    required this.id,
    required this.title,
    required this.color,
  });

  factory ToDoCollection.empty() {
    return ToDoCollection(
      id: CollectionId(),
      title: '',
      color: ToDoColor(colorIndex: 0),
    );
  }
}
