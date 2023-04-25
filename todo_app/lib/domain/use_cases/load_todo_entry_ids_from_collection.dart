import 'package:either_dart/either.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class LoadToDoEntryIdsFromCollection
    implements UseCase<List<EntryId>, CollectionIdParam> {
  const LoadToDoEntryIdsFromCollection({required this.toDoRepository});

  final TodoRepository toDoRepository;

  @override
  Future<Either<Failure, List<EntryId>>> call(CollectionIdParam params) async {
    try {
      final loadedIds = toDoRepository.readToDoEntryIds(
        params.collectionId,
      );

      return loadedIds.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
