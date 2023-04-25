import 'package:test/test.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/data/repositories/todo_repository_mock.dart';
import 'package:todo_app/domain/use_cases/load_todo_collection.dart';

void main() {
  group('LoadTodoCollection', () {
    group('should return ToDoCollection', () {
      test('expect LoadTodoCollection returns 10 loadedCollections', () async {
        final mockLoadToDoCollections =
            LoadToDoCollections(todoRepository: TodoRepositoryMock());
        final result = await mockLoadToDoCollections.call(NoParams());
        expect(result.isLeft, false);
        expect(result.isRight, true);
        expect(result.right.length, 10);
      });
    });
  });
}
