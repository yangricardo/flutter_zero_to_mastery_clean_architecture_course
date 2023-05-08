import 'dart:io';

import 'package:isar/isar.dart';
import 'package:jwt_chopper_isar_login_stacked_app/data/isar/user_collection.dart';
import 'package:path_provider/path_provider.dart';

class LocalDataService {
  late final Directory _dir;
  late final Isar _isar;

  LocalDataService() {
    init();
  }

  Future<void> init() async {
    _dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UserSchema],
      directory: _dir.path,
    );
  }

  Future<User?> getUser(int userId) async {
    return await _isar.users.get(userId);
  }

  Future<void> createOrUpdateUser(User user) async {
    await _isar.writeTxn(() async {
      await _isar.users.put(user);
    });
  }

  Future<void> deleteUser(int userId) async {
    await _isar.writeTxn(() async {
      await _isar.users.delete(userId); //delete
    });
  }
}
