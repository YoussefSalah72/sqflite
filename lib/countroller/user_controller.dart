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
    dataUser= await db.selectusertabledata();
  }
  void updateUser({required String username,required int id}) async {
    MySqfliteDatabase db = MySqfliteDatabase();
     await db.updateusertable(username: username, id: id);
     select();
  }
  void deleteUsertable({required int id}) async {
    MySqfliteDatabase db = MySqfliteDatabase();
    await db.deleteUsertable(id: id);
    select();
  }
}
