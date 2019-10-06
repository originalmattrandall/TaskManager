import 'package:sqflite/sqflite.dart';
import 'package:task_manager/data/resources/db_helper.dart';

class TaskDBHelper{
    static final tableName = "tasks";

    // Column Names for the Task table
    static final id = "id";
    static final groupId = "groupId";
    static final listId = "listId";
    static final priorityId = "priorityId";
    static final name = "name";
    static final description = "description";
    static final hasList = "hasList";
    static final hasReminder = "hasReminder";
    static final isComplete = "isComplete";
    static final isArchived = "isArchived";

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