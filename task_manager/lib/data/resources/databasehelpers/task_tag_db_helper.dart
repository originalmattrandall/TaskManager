import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class TaskTagDbHelper{
  static final tableName = "task_tag";

  // Column Names for the Task table
  static final id = "id";
  static final taskId = "task_id";
  static final tagId = "tag_id";

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
      where: "task_id = ?",
      whereArgs: [id]
    );
  }

  // Returns all of the rows in the database
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await dbHelper.database;
    return await db.query(tableName);
  }
}