import 'package:task_manager/data/models/task.dart';

import 'db_helper.dart';

import 'package:sqflite/sqflite.dart';

class TaskDBHelper{
    static final tableName = "tasks";

    // Column Names for the Task table
    static final id = "id";
    static final groupId = "group_id";
    static final listId = "list_id";
    static final priorityId = "priority_id";
    static final name = "name";
    static final description = "description";
    static final hasList = "has_list";
    static final hasReminder = "has_reminder";
    static final isComplete = "is_complete";
    static final isArchived = "is_archived";

    // Inserts a row and returns the inserted rows id.
    static Future<void> insert(TaskModel task) async{
      Database db = await DBHelper.instance.database;
      await db.insert(
        tableName, 
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
      );
    }

    // Returns all of the rows in the database
    Future<List<TaskModel>> queryAllRows() async {
      Database db = await DBHelper.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(tableName);

      return List.generate(maps.length, (i) {
        return TaskModel(
          id: maps[i][id],
          groupId: maps[i][groupId],
          listId: maps[i][listId],
          priorityId: maps[i][priorityId],
          name: maps[i][name],
          description: maps[i][description] ?? "",
          hasList: maps[i][hasList],
          hasReminder: maps[i][hasReminder],
          isComplete: maps[i][isComplete],
          isArchived: maps[i][isArchived]
        );
      });
    }

    // Updates a row in the database where the id is set in the model class
    Future<int> update(Map<String, dynamic> row) async {
      Database db = await DBHelper.instance.database;
      int idOfRow = row[id];
      return await db.update(tableName, row, where: '$id = ?', whereArgs: [idOfRow]);
    }

    // Delete a row from the database
    Future<int> delete(int idToDelete) async {
      Database db = await DBHelper.instance.database;
      return await db.delete(tableName, where: '$id = ?', whereArgs: [idToDelete]);
    }
}