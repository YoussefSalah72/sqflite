import '../core/database/sqflite/my_sqflite_database.dart';

class ProductController {
  List productdata = [];
  ProductController(){
    select();
  }
  void insertProduct({required String Productname , required double price , required int count}) async {
    MySqfliteDatabase db = MySqfliteDatabase();
    await db.InsertToProductTable( Productname:Productname , price: price, count: count);
    select();
  }
  void select() async {
    MySqfliteDatabase db = MySqfliteDatabase();
    productdata= await db.selectProducttabledata();
  }
  void updateUser({required String username,required int id}) async {
    MySqfliteDatabase db = MySqfliteDatabase();
    await db.updateusertable(username: username, id: id);
    select();
  }
  void updateProduct({required String Productname , required double price , required int count,required int id}) async {
    MySqfliteDatabase db = MySqfliteDatabase();
    await db.updateProductTable(Productname:Productname , price: price, count: count, id: id,
    );
    select();
  }
  void deleteProductTable({required int id}) async {
    MySqfliteDatabase db = MySqfliteDatabase();
    await db.deleteProductTable(id: id);
    select();
  }
}
