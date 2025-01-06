import 'package:sqflite/sqflite.dart' as sqfliteDatabase;
import 'package:sqflite/sqlite_api.dart';
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

  Database? _db ;
  Future<Database> _initDatabase() async {
    String databasesPath = await sqfliteDatabase.getDatabasesPath();
    String managementDatabaseName = "management.db";
    String realDatabasePath = join(databasesPath, managementDatabaseName);
    int versionDatabase = 1;
    _db ??= await sqfliteDatabase.openDatabase(realDatabasePath,
    onCreate: _oncreate,
      version: versionDatabase
    );
    return _db!;
  }
  _oncreate(sqfliteDatabase.Database db, int version) async {
    await db.execute("CREATE TABLE $_userTable ($_userColumnId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        " $_userColumnUsername TEXT ,"
        " $_userColumnPassword TEXT)");
    ////////////////////////
    await db.execute("CREATE TABLE $_productTable ($_productColumnId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        " $_productColumnUsername TEXT , "
        " $_productColumnPrice REAL ,"
        " $_productColumnProductCount INTEGER)");
    ///////////////////////
    await db.execute("CREATE TABLE $_salesTable ($_salesColumnId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        " $_salesColumnProductName TEXT ,"
        " $_salesColumnUsername TEXT)");
  }

  @override
  Future<bool> delete() async {
    await _initDatabase();
    int deleted = await _db!.delete(_userTable, where: "$_userColumnId ==1");
    await _db!.close();
    return deleted > 0 ? true : false;
  }

  @override
  Future<bool> insert() async {
    await _initDatabase();
     int inserted = await _db!.insert( _userTable, {
      _userColumnUsername: "ahmed",
      _userColumnPassword: "123456"
    });
    await _db!.close();
    return inserted > 0 ? true : false;
  }

  @override
  Future<bool> select() {
    // TODO: implement select
    throw UnimplementedError();
  }

  @override
  Future<bool> update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
