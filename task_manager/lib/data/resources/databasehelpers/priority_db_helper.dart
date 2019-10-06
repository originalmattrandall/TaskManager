import 'db_helper.dart';

import 'package:sqflite/sqflite.dart';

class PriorityDBHelper{
  static final tableName = "priority";

  // Column names
  static final id = "id";
  static final name = "name";
  static final colorCode = "color_code";
  static final level = "level";

  // Reference to our single dbhelper
  final dbHelper = DBHelper.instance;

  // Inserts a row and returns the inserted rows id.
  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await dbHelper.database;
    return await db.insert(tableName, row);
  }

  // Returns all of the rows in the database
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await dbHelper.database;
    return await db.query(tableName);
  }

  // Updates a row in the database where the id is set in the model class
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await dbHelper.database;
    int idOfRow = row[id];
    return await db.update(tableName, row, where: '$id = ?', whereArgs: [idOfRow]);
  }

  // Delete a row from the database
  Future<int> delete(int idToDelete) async {
    Database db = await dbHelper.database;
    return await db.delete(tableName, where: '$id = ?', whereArgs: [idToDelete]);
  }
}