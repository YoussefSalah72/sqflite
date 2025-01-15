import '../core/database/sqflite/my_sqflite_database.dart';

class SalesController {
  List dataUser = [];
  List dataProduct = [];
  List dataSales = [];
  int? valueBottonsUsers ;
  int? valueBottonsProducts ;

  SalesController(){
    init();
  }
  init()async{
    await selectUsers();
    if(dataUser.isNotEmpty){
      valueBottonsUsers = dataUser[0]['user_id'];
    }
    await selectProducts();
    if(dataProduct.isNotEmpty){
      valueBottonsProducts = dataProduct[0]['product_id'];
    }

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
    print(dataProduct);
  }

  Future<void>InsertToSales() async {
    if(valueBottonsUsers !=null&& valueBottonsProducts !=null){

      MySqfliteDatabase db = MySqfliteDatabase();
      bool inserted = await db.InsertToSalesTable( usernameId: valueBottonsUsers!, ProductnameId: valueBottonsProducts!);
      print(inserted);
    }

  }
}
