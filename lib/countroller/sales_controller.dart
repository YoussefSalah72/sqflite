import '../core/database/sqflite/my_sqflite_database.dart';

class SalesController {
  List dataUser = [];
  int valueBottons = 0;

  SalesController(){
    selectUsers();

  }

  Future<void> selectUsers() async {
    MySqfliteDatabase db = MySqfliteDatabase();
    dataUser= await db.selectusertabledata();
    valueBottons = dataUser[0]['user_id'];
  }
}
