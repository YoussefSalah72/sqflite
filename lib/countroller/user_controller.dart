import '../core/database/sqflite/my_sqflite_database.dart';

class UserController {
  List dataUser = [];
  UserController(){
    select();
  }
  void insertUser({required String usernamecountroller}) async {
    MySqfliteDatabase db = MySqfliteDatabase();
    bool inserted = await db.InsertToUserTable(username: usernamecountroller);
    select();
  }
  void select() async {
    MySqfliteDatabase db = MySqfliteDatabase();
    dataUser= await db.select();
  }
}
