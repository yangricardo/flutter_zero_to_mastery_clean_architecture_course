import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';

abstract class Params extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class ToDoEntryIdsParam extends Params {
  ToDoEntryIdsParam({
    required this.collectionId,
    required this.entryId,
  }) : super();

  final EntryId entryId;
  final CollectionId collectionId;

  @override
  List<Object> get props => [collectionId, entryId];
}

class CollectionIdParam extends Params {
  CollectionIdParam({
    required this.collectionId,
  }) : super();

  final CollectionId collectionId;

  @override
  List<Object> get props => [collectionId];
}

class ToDoCollectionParams extends Params {
  ToDoCollectionParams({
    required this.collection,
  }) : super();

  final ToDoCollection collection;

  @override
  List<Object> get props => [collection];
}
