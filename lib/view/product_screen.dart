import 'package:flutter/material.dart';

import '../core/database/sqflite/my_sqflite_database.dart';
import '../countroller/user_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _usernameEditController = TextEditingController();

  late UserController _userController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userController=UserController();
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                    label: Text("Username"),
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(onPressed: () async {
                  _userController.insertUser(usernamecountroller: _usernameController.text,);
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
                              child: Row(children: [Text("id:"+_userController.dataUser[index]["user_id"].toString(),style: (TextStyle(fontSize: 10)),),
                                Text("   name:"+_userController.dataUser[index]["username"].toString(),style: (TextStyle(fontSize: 10)),)],),
                              onTap: (){
                                int id=_userController.dataUser[index]["user_id"];
                                _usernameEditController.text=_userController.dataUser[index]["username"].toString();
                                showModalBottomSheet(context: context,
                                    builder: (cotext)=> Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                            children: [
                                              TextField(
                                                controller: _usernameEditController,
                                                decoration: InputDecoration(
                                                  label: Text("Username"),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              Row(
                                                  children: [
                                                    ElevatedButton(onPressed: () async {
                                                      _userController.updateUser(username: _usernameEditController.text, id: id);
                                                      Navigator.of(context).pop();
                                                      setState(() {

                                                      });
                                                    }, child: Text("Update")),
                                                    ElevatedButton(onPressed: () async {
                                                      _userController.deleteUsertable(id: id);
                                                      Navigator.of(context).pop();
                                                      setState(() {});
                                                    }, child: Text("Delete")),
                                                  ])
                                            ]),
                                      ) ,
                                    ) );
                              },
                            ),
                        separatorBuilder: (cotext,index)=>SizedBox(height: 10) , itemCount: _userController.dataUser.length))
              ],),
          ),
        )
    );
  }
}
