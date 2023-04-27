import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/data_sources/interfaces/todo_local_data_source_interface.dart';
import 'package:todo_app/data/data_sources/models/todo_entry_model.dart';
import 'package:todo_app/data/data_sources/models/todo_collection_model.dart';

const String collectionBox = 'collections';
const String entriesBox = 'entries';

class HiveLocalDataSource implements ToDoLocalDataSourceInterface {
  late BoxCollection todoCollections;

  bool isInitialize = false;

  Future<void> init() async {
    if (!isInitialize) {
      todoCollections = await BoxCollection.open(
          'todo', {collectionBox, entriesBox},
          path: "./");
      isInitialize = true;
    } else {
      debugPrint('HiveLocalDataSource is already initialized');
    }
  }

  @override
  Future<bool> createToDoCollection({required ToDoCollectionModel collection}) {
    // TODO: implement createToDoCollection
    throw UnimplementedError();
  }

  @override
  Future<bool> createToDoEntry(
      {required String collectionId, required ToDoEntryModel entry}) {
    // TODO: implement createToDoEntry
    throw UnimplementedError();
  }

  @override
  Future<ToDoCollectionModel> getToDoCollection(
      {required String collectionId}) {
    // TODO: implement getToDoCollection
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getToDoCollectionIds({required String collectionId}) {
    // TODO: implement getToDoCollectionIds
    throw UnimplementedError();
  }

  @override
  Future<List<ToDoCollectionModel>> getToDoCollections() {
    // TODO: implement getToDoCollections
    throw UnimplementedError();
  }

  @override
  Future<ToDoEntryModel> getToDoEntry(
      {required String collectionId, required String entryId}) {
    // TODO: implement getToDoEntry
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getToDoEntryIds({required String collectionId}) {
    // TODO: implement getToDoEntryIds
    throw UnimplementedError();
  }

  @override
  Future<ToDoEntryModel> updateToDoEntry(
      {required String collectionId, required String entryId}) {
    // TODO: implement updateToDoEntry
    throw UnimplementedError();
  }
}
