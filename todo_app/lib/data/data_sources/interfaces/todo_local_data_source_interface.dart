import 'package:todo_app/data/data_sources/models/todo_collection_model.dart';
import 'package:todo_app/data/data_sources/models/todo_entry_model.dart';

abstract class ToDoLocalDataSourceInterface {
  Future<List<ToDoCollectionModel>> getToDoCollections();
  Future<ToDoCollectionModel> getToDoCollection({
    required String collectionId,
  });

  Future<List<String>> getToDoCollectionIds({
    required String collectionId,
  });

  Future<List<String>> getToDoEntryIds({
    required String collectionId,
  });
  Future<ToDoEntryModel> getToDoEntry({
    required String collectionId,
    required String entryId,
  });
  Future<bool> createToDoEntry({
    required String collectionId,
    required ToDoEntryModel entry,
  });
  Future<bool> createToDoCollection({
    required ToDoCollectionModel collection,
  });
  Future<ToDoEntryModel> updateToDoEntry({
    required String collectionId,
    required String entryId,
  });
}
