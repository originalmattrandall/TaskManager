import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class FilterTagDbHelper{
  static final tableName = "filter_tag";

  // Column Names for the Task table
  static final id = "id";
  static final tagId = "tag_id";
  static final filterId = "filter_id";
  
  // Reference to our single dbhelper
  final dbHelper = DBHelper.instance;

  // Inserts a row and returns the inserted rows id.
  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await dbHelper.database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryByTaskId(int id) async{
    Database db = await dbHelper.database;
    return await db.query(
      tableName,
      where: "$tagId = ?",
      whereArgs: [id]
    );
  }

  Future<List<Map<String, dynamic>>> queryByFilterId(int id) async{
    Database db = await dbHelper.database;
    return await db.query(
      tableName,
      where: "$filterId = ?",
      whereArgs: [id]
    );
  }

  // Returns all of the rows in the database
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await dbHelper.database;
    return await db.query(tableName);
  }

  Future<void> clearDatabase() async {
    final db = await dbHelper.database;
    await db.delete(tableName);
  }
}