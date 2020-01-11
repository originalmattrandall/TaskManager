import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
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
    Future<int> insert(TaskModel task) async{
      Database db = await DBHelper.instance.database;
      return await db.insert(
        tableName, 
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
      );
    }

    // Returns all of the rows in the database
    Future<List<TaskModel>> queryAllRows() async {
      Database db = await DBHelper.instance.database;
      final List<Map<String, dynamic>> dbTasks = await db.query(tableName);
      final List<Map<String, dynamic>> dbTags = await db.query(TagDBHelper.tableName);

      var tasks = new List<TaskModel>();

      for(var task in dbTasks){
        var tags = new List<String>();

        for(var tag in dbTags){
          if(task[id] == tag[TagDBHelper.taskId]){
            tags.add(tag[TagDBHelper.name]);
          }
        }

        var newTask = new TaskModel(
          id: task[id],
          groupId: task[groupId],
          listId: task[listId],
          priorityId: task[priorityId],
          name: task[name],
          description: task[description],
          hasList: task[hasList],
          hasReminder: task[hasReminder],
          isComplete: task[isComplete],
          isArchived: task[isArchived],
          tags: tags
        );

        tasks.add(newTask);
      }

      return tasks;
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