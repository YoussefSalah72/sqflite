import 'package:flutter/material.dart';
import 'package:sqflite__departement/app/sqflite_app.dart';
import 'package:sqflite__departement/core/database/sqflite/my_sqflite_database.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  MySqfliteDatabase db = MySqfliteDatabase();
  bool deleted = await db.delete();
  print(deleted);
  runApp(const SqfliteApp());
}
