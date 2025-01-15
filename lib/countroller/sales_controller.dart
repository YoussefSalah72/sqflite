import '../core/database/sqflite/my_sqflite_database.dart';

class SalesController {
  List dataUser = [];
  List dataProduct = [];
  List dataSales = [];
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

  Future<void> selectSales() async {
    MySqfliteDatabase db = MySqfliteDatabase();
    dataSales= await db.selectSalesTableData();
  }

  Future<void> selectProducts() async {
    MySqfliteDatabase db = MySqfliteDatabase();
    dataProduct= await db.selectProducttabledata();
    valueBottonsProducts = dataProduct[0]['product_id'];
  }

  Future<void>InsertToSales() async {
    String username = "";
    String Productname = "";

    if(valueBottonsUsers !=null){
      for(int i=0; i<dataUser.length; i++){
        if(valueBottonsUsers == dataUser[i]['user_id']){
          username = dataUser[i]['username'];
        }
      }
      ///
      for(int i=0; i<dataProduct.length; i++){
        if(valueBottonsProducts == dataProduct[i]['product_id']){
          Productname = dataProduct[i]['username'];
        }
      }
      MySqfliteDatabase db = MySqfliteDatabase();
      bool inserted = await db.InsertToSalesTable(username: username, Productname: Productname);
      print(inserted);
    }

  }
}
