import 'package:flutter/material.dart';
import 'package:sqflite__departement/countroller/Product_controller.dart';

import '../core/database/sqflite/my_sqflite_database.dart';
import '../countroller/user_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController _ProductNameController = TextEditingController();
  TextEditingController _ProductnameEditController = TextEditingController();
  TextEditingController _ProductPriceController = TextEditingController();
  TextEditingController _ProductCountController = TextEditingController();
  TextEditingController _ProductPriceEditController = TextEditingController();
  TextEditingController _ProductCountEditController = TextEditingController();


  late ProductController _productController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productController=ProductController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Product Screen"),),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _ProductNameController,
                  decoration: InputDecoration(
                    label: Text("Product Name"),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _ProductPriceController,
                  decoration: InputDecoration(
                    label: Text("Price"),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _ProductCountController,
                  decoration: InputDecoration(
                    label: Text("Count"),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),

                ElevatedButton(onPressed: () async {
                  _productController.insertProduct( Productname: _ProductNameController.text, price: double.parse(_ProductPriceController.text) , count: int.parse(_ProductCountController.text) ,);
                  setState(() {

                  });

                }, child: Text("inserted")),
                ElevatedButton(onPressed: () async {
                  setState(() {});
                }, child: Text("Refresh")),
                Expanded(
                    child: ListView.separated(
                        itemBuilder:( context, index)=>
                            InkWell(
                              child:Row(children: [Text("id:"+_productController.productdata[index]["product_id"].toString(),style: (TextStyle(fontSize: 10)),),
                                Text("   name:"+_productController.productdata[index]["username"].toString(),style: (TextStyle(fontSize: 10)),),
                                Text("   price:"+_productController.productdata[index]["price"].toString(),style: (TextStyle(fontSize: 10)),),
                                Text("   count:"+_productController.productdata[index]["product_count"].toString(),style: (TextStyle(fontSize: 10)),)],),
                              onTap: (){
                                int id=_productController.productdata[index]["product_id"];
                                _ProductnameEditController.text=_productController.productdata[index]["username"].toString();
                                _ProductPriceEditController.text=_productController.productdata[index]["price"].toString();
                                _ProductCountEditController.text=_productController.productdata[index]["product_count"].toString();
                                showModalBottomSheet(context: context,
                                    builder: (cotext)=> Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                            children: [
                                              TextField(
                                                keyboardType: TextInputType.text,
                                                controller: _ProductnameEditController,
                                                decoration: InputDecoration(
                                                  label: Text("Product Name"),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              const SizedBox(height: 20,),
                                              TextField(
                                                keyboardType: TextInputType.number,
                                                controller:  _ProductPriceEditController,
                                                decoration: InputDecoration(
                                                  label: Text("Price"),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              const SizedBox(height: 20,),
                                              TextField(
                                                keyboardType: TextInputType.number,
                                                controller: _ProductCountEditController,
                                                decoration: InputDecoration(
                                                  label: Text("Count"),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              const SizedBox(height: 20,),
                                              Row(
                                                  children: [
                                                    ElevatedButton(onPressed: () async {
                                                      _productController.updateProduct(
                                                        Productname: _ProductnameEditController.text,
                                                        price: double.parse(_ProductPriceEditController.text),
                                                        count: int.parse(_ProductCountEditController.text),
                                                        id: id,);
                                                      Navigator.of(context).pop();
                                                      setState(() {

                                                      });
                                                    }, child: Text("Update")),
                                                    ElevatedButton(onPressed: () async {
                                                      _productController.deleteUsertable(id: id);
                                                      Navigator.of(context).pop();
                                                      setState(() {});
                                                    }, child: Text("Delete")),
                                                  ])
                                            ]),
                                      ) ,
                                    ) );
                              },
                            ),
                        separatorBuilder: (cotext,index)=>SizedBox(height: 10) , itemCount: _productController.productdata.length))
              ],),
          ),
        )
    );
  }
}
