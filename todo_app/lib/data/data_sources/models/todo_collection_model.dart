import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/entities/todo_color_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';

part 'todo_collection_model.g.dart';

@JsonSerializable()
class ToDoCollectionModel extends Equatable {
  final int colorIndex;
  final String title;
  final String id;

  const ToDoCollectionModel({
    required this.id,
    required this.title,
    required this.colorIndex,
  });

  factory ToDoCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$ToDoCollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoCollectionModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        colorIndex,
      ];

  static ToDoCollection toToDoCollection(ToDoCollectionModel collection) {
    return ToDoCollection(
      id: CollectionId.fromUniqueString(collection.id),
      title: collection.title,
      color: ToDoColor(colorIndex: collection.colorIndex),
    );
  }
}
