import'package:flutter/material.dart';
import 'package:sqflite__departement/core/database/sqflite/my_sqflite_database.dart';
import 'package:sqflite__departement/countroller/sales_controller.dart';

import '../countroller/sales_controller.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  late SalesController _salesController;
  @override
  void initState() {
    _salesController=SalesController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Sales Screen"),),
      body: FutureBuilder(future: _salesController.selectUsers(), builder:(context, snapshot)=> Center(child:
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Users"),
              SizedBox(width: 50,),
              DropdownButton(
                  value: _salesController.valueBottonsUsers,
                  items:[
                    for(int i=0; i<_salesController.dataUser.length; i++)
                      DropdownMenuItem(
                        value: _salesController.dataUser[i]['user_id'],
                        child:Text(_salesController.dataUser[i]['username']),),
                  ] , onChanged: (value){
                _salesController.valueBottonsUsers = int.parse(value.toString());
                setState(() {

                });
              }),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Products"),
              SizedBox(width: 50,),
              DropdownButton(
                  value: _salesController.valueBottonsProducts,
                  items:[
                    for(int i=0; i<_salesController.dataProduct.length; i++)
                      DropdownMenuItem(
                        value: _salesController.dataProduct[i]['product_id'],
                        child:Text("${_salesController.dataProduct[i]['product_name']} / ${_salesController.dataProduct[i]['price']}"),),
                  ] , onChanged: (value){
                _salesController.valueBottonsProducts = int.parse(value.toString());
                setState(() {

                });
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async {setState(() {});;}, child: Text("refresh")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: () async {_salesController.InsertToSales();_salesController.selectSales();setState(() {});}, child: Text("add")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: () async {_salesController.selectSales();}, child: Text("get Data ")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: () async  {MySqfliteDatabase db=MySqfliteDatabase(); var sales = await db.sales(); print(sales.length); setState(() {});}, child: Text("sales")),
            ],

          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder:( context, index)=>
                      InkWell(
                        child: Row(children: [Text("id:"+_salesController.dataSales[index]["sales_id"].toString(),style: (TextStyle(fontSize: 10)),),
                          Text("   user:"+_salesController.dataSales[index]['username'].toString(),style: (TextStyle(fontSize: 10)),),
                          Text("   Product name:"+_salesController.dataSales[index]['product_name'].toString(),style: (TextStyle(fontSize: 10)),)
                        ],),
                        // onTap: (){
                        //   int id=_userController.dataUser[index]["user_id"];
                        //   _usernameEditController.text=_userController.dataUser[index]["username"].toString();
                        //   showModalBottomSheet(context: context,
                        //       builder: (cotext)=> Container(
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(20.0),
                        //           child: Column(
                        //               children: [
                        //                 TextField(
                        //                   controller: _usernameEditController,
                        //                   decoration: InputDecoration(
                        //                     label: Text("Username"),
                        //                     border: OutlineInputBorder(),
                        //                   ),
                        //                 ),
                        //                 Row(
                        //                     children: [
                        //                       ElevatedButton(onPressed: () async {
                        //                         _userController.updateUser(username: _usernameEditController.text, id: id);
                        //                         Navigator.of(context).pop();
                        //                         setState(() {
                        //
                        //                         });
                        //                       }, child: Text("Update")),
                        //                       ElevatedButton(onPressed: () async {
                        //                         _userController.deleteUsertable(id: id);
                        //                         Navigator.of(context).pop();
                        //                         setState(() {});
                        //                       }, child: Text("Delete")),
                        //                     ])
                        //               ]),
                        //         ) ,
                        //       ) );
                        // },
                      ),
                  separatorBuilder: (cotext,index)=>SizedBox(height: 10) , itemCount: _salesController.dataSales.length))
        ],
      ), ), )
    );
  }
}
