import 'package:sqflite/sqflite.dart' as sqfliteDatabase;
import 'package:sqflite__departement/core/database/sqflite/crud.dart';
import 'package:path/path.dart';
class MySqfliteDatabase extends CRUD {
  static const String _userTable = "users";
  static const String _userColumnId = "user_id";
  static const String _userColumnUsername = "username";
  static const String _userColumnPassword = "password";
  static const String _productTable = "product";
  static const String _productColumnId = "product_id";
  static const String _productColumnUsername = "username";
  static const String _productColumnPrice = "price";
  static const String _productColumnProductCount = "product_count";
  static const String _salesTable = "sales";
  static const String _salesColumnId = "sales_id";
  static const String _salesColumnProductName = "product_name";
  static const String _salesColumnUsername = "sales_username";

  initDatabase() async {
    String databasesPath = await sqfliteDatabase.getDatabasesPath();
    String managementDatabaseName = "management.db";
    String realDatabasePath = join(databasesPath, managementDatabaseName);
    int versionDatabase = 1;
    sqfliteDatabase.openDatabase(realDatabasePath,
    onCreate: _oncreate,
      version: versionDatabase
    );
  }
  _oncreate(sqfliteDatabase.Database db, int version) async {
    await db.execute("CREATE TABLE $_userTable ($_userColumnId INTEGER ,"
        " $_userColumnUsername TEXT ,"
        " $_userColumnPassword TEXT)");
    ////////////////////////
    await db.execute("CREATE TABLE $_productTable ($_productColumnId INTEGER ,"
        " $_productColumnUsername TEXT , "
        " $_productColumnPrice REAL ,"
        " $_productColumnProductCount INTEGER)");
    ///////////////////////
    await db.execute("CREATE TABLE $_salesTable ($_salesColumnId INTEGER ,"
        " $_salesColumnProductName TEXT ,"
        " $_salesColumnUsername TEXT)");
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
