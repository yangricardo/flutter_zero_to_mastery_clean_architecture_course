import 'package:todo_app/domain/entities/todo_color_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:either_dart/either.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class TodoRepositoryMock implements TodoRepository {
  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    final list = List<ToDoCollection>.generate(
        10,
        (index) => ToDoCollection(
            id: CollectionId.fromUniqueString(index.toString()),
            title: 'Task $index',
            color: ToDoColor(
                colorIndex: index % ToDoColor.predefinedColors.length)));
    return Future.delayed(const Duration(milliseconds: 200), () => Right(list));
  }
}
