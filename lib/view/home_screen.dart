import 'package:flutter/material.dart';

import '../core/database/sqflite/my_sqflite_database.dart';
import '../countroller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _usernameController = TextEditingController();
  late UserController _userController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userController=UserController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
            TextField(
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
              Expanded(
                  child: ListView.separated(
                      itemBuilder:( context, index)=>
                          Row(children: [Text("id:"+_userController.dataUser[index]["user_id"].toString(),style: (TextStyle(fontSize: 10)),),
                            Text("   name:"+_userController.dataUser[index]["username"].toString(),style: (TextStyle(fontSize: 10)),)],) ,
                      separatorBuilder: (cotext,index)=>SizedBox(height: 10) , itemCount: _userController.dataUser.length))
          ],),
        ),
      )
    );
  }
}
