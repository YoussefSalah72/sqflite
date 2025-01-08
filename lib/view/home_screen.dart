import 'package:flutter/material.dart';

import '../core/database/sqflite/my_sqflite_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextField(
              decoration: InputDecoration(
                label: Text("Username"),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed: () async {
              MySqfliteDatabase db = MySqfliteDatabase();
              bool inserted = await db.InsertToUserTable(username: _usernameController.text);
              print(inserted);
            }, child: Text("inserted")),
          ],),
        ),
      )
    );
  }
}
