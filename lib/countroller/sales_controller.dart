import '../core/database/sqflite/my_sqflite_database.dart';

class SalesController {
  List dataUser = [];
  List dataProduct = [];
  int valueBottonsUsers = 0;
  int valueBottonsProducts = 0;

  SalesController(){
    init();
  }
  init()async{
    await selectUsers();
    valueBottonsUsers = dataUser[0]['user_id'];
    await selectProducts();
  }

  Future<void> selectUsers() async {
    MySqfliteDatabase db = MySqfliteDatabase();
    dataUser= await db.selectusertabledata();
  }
  Future<void> selectProducts() async {
    MySqfliteDatabase db = MySqfliteDatabase();
    dataProduct= await db.selectProducttabledata();
    valueBottonsProducts = dataProduct[0]['product_id'];
  }
}
