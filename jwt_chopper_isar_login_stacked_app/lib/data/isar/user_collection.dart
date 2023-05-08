import 'package:isar/isar.dart';

part 'user_collection.g.dart';

@collection
class User {
  Id? id = Isar
      .autoIncrement; // você também pode attribuir id = null para incrementar automaticamente

  String? name;

  String? email;
  String? password;
}
