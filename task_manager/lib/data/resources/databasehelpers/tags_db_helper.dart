import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class TagDBHelper{
  static final tableName = "tag";

  // Column Names for the Task table
  static final id = "id";
  static final taskId = "task_id";
  static final name = "name";

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
  Future<List<Map<String, dynamic>>> queryByTaskId(int id) async {
    Database db = await dbHelper.database;
    return await db.query(
      tableName,
      distinct:true,
      where: '$taskId = ?', 
      whereArgs: [id]);
  }
}