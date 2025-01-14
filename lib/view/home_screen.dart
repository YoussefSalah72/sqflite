import 'package:flutter/material.dart';
import 'package:sqflite__departement/view/product_screen.dart';
import 'package:sqflite__departement/view/sales_screen.dart';

import 'User_Screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
        body: SizedBox(
          width: double.infinity,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserScreen()));}, child: Text("User Screen")),
              ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen()));}, child: Text("Product Screen")),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalesScreen()));
              }, child: Text("Sales Screen")),
            ],
          )),
        )));
  }
}
