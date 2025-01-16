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
  static const String _productColumnUsername = "product_name";
  static const String _productColumnPrice = "price";
  static const String _productColumnProductCount = "product_count";
  static const String _salesTable = "sales";
  static const String _salesColumnId = "sales_id";
  static const String _salesColumnProductID = "sales_name_Id";
  static const String _salesColumnUsernameID = "sales_username_Id";

  Database? _db ;
  Future<Database> _initDatabase() async {
    String databasesPath = await sqfliteDatabase.getDatabasesPath();
    String managementDatabaseName = "management.db";
    String realDatabasePath = join(databasesPath, managementDatabaseName);
    int versionDatabase = 4;
    _db ??= await sqfliteDatabase.openDatabase(realDatabasePath,
    onCreate: _oncreate,
      onOpen: (db)async{
      await db.execute("PRAGMA foreign_keys = ON");
      },
      onUpgrade: (db, oldVersion, newVersion) {},
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
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $_salesTable ("
            " $_salesColumnId INTEGER PRIMARY KEY AUTOINCREMENT,"
            " $_salesColumnProductID INTEGER,"
            " $_salesColumnUsernameID INTEGER,"
            " CONSTRAINT user_sales_relation FOREIGN KEY ($_salesColumnProductID) REFERENCES $_productTable($_productColumnId) ON DELETE CASCADE ON UPDATE CASCADE,"
            " CONSTRAINT product_sales_relation FOREIGN KEY ($_salesColumnUsernameID) REFERENCES $_userTable($_userColumnId) ON DELETE CASCADE ON UPDATE CASCADE"
            ");"
    );

  }

  Future<bool> deleteUsertable({required int id}) async {
   return delete(tablename: _userTable, where: "$_userColumnId == $id");
  }
  Future<bool> deleteProductTable({required int id}) async {
    return delete(tablename: _productTable, where: "$_productColumnId == $id");
  }

  Future<bool> delete({required String tablename,required String where}) async {
    await _initDatabase();
    int deleted = await _db!.delete(tablename, where: where);
    await _db!.close();
    return deleted > 0 ? true : false;
  }

  Future<bool> InsertToUserTable({required String username}){
    return insert( values: {
      _userColumnUsername : username
    }, tablename: _userTable);
  }

  Future<bool> InsertToProductTable({required String Productname , required double
  price , required int count}){
    return insert( values: {
      _productColumnUsername : Productname,
      _productColumnPrice : price,
      _productColumnProductCount : count
    }, tablename: _productTable);
  }

  Future<bool> InsertToSalesTable({required int usernameId, required int ProductnameId}){
    return insert( values: {
      _salesColumnUsernameID : usernameId,
      _salesColumnProductID : ProductnameId
    }, tablename: _salesTable);
  }

  @override
  Future<bool> insert({required String tablename , required Map<String,dynamic> values}) async {
    await _initDatabase();
     int inserted = await _db!.insert( tablename, values);
    await _db!.close();
    return inserted > 0 ? true : false;
  }

  Future<List<Map<String, Object?>>> selectusertabledata() async {
    return select(tablename: _userTable);
  }

  Future<List<Map<String, Object?>>> selectProducttabledata() async {
    return select(tablename: _productTable);
  }

  Future<List<Map<String, Object?>>> sales() async {
    return select(tablename: _salesTable);
  }

  Future<List<Map<String, Object?>>> selectSalesTableData() async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.rawQuery('SELECT $_salesTable.$_salesColumnId,'
        '$_productTable.$_productColumnUsername,'
        '$_userTable.$_userColumnUsername'
        ' FROM $_salesTable,$_productTable,$_userTable WHERE '
        '$_salesTable.$_salesColumnUsernameID = $_userTable.$_userColumnId AND '
        '$_salesTable.$_salesColumnProductID = $_productTable.$_productColumnId'
    );
    await _db!.close();
    return data;
  }

  @override
  Future<List<Map<String, Object?>>> select({required String tablename}) async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.query( tablename,);
    await _db!.close();
    return data;
  }


  Future<bool> updateusertable({required String username,required int id}) async {
    return update(tablename: _userTable, values: {_userColumnUsername : username}, where: "$_userColumnId = $id");
  }

  Future<bool> updateProductTable({required String Productname, required double price , required int count , required int id}) async {
    return update(tablename: _productTable, values:
    {_productColumnUsername : Productname,
     _productColumnPrice : price,
     _productColumnProductCount : count
    }, where: "$_productColumnId = $id");
  }

  @override
  Future<bool> update({required String tablename ,required Map<String,Object?> values,required String where}) async {
    await _initDatabase();
    int inserted = await _db!.update(
        tablename,
        values,
      where: where
    );
    await _db!.close();
    return inserted > 0 ? true : false;
  }
}
