import'package:flutter/material.dart';
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Users"),
          SizedBox(width: 50,),
          DropdownButton(
              value: _salesController.valueBottons,
              items:[
                for(int i=0; i<_salesController.dataUser.length; i++)
                  DropdownMenuItem(
                    value: _salesController.dataUser[i]['user_id'],
                    child:Text(_salesController.dataUser[i]['username']),),
              ] , onChanged: (value){}),
        ],
      )
        ,), )
    );
  }
}
