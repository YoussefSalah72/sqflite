import 'package:sqflite/sqflite.dart' as sqfliteDatabase;
import 'package:sqflite__departement/core/database/sqflite/crud.dart';
import 'package:path/path.dart';
class MySqfliteDatabase extends CRUD {
  initDatabase() async {
    String databasesPath = await sqfliteDatabase.getDatabasesPath();
    String managementDatabaseName = "management.db";
    String realDatabasePath = join(databasesPath, managementDatabaseName);
    int versionDatabase = 1;
    sqfliteDatabase.openDatabase(realDatabasePath,
    onCreate: (db, version) {

    },
      version: versionDatabase
    );
  }

  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> insert() {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> select() {
    // TODO: implement select
    throw UnimplementedError();
  }

  @override
  Future<void> update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
