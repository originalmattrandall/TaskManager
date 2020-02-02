import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_tag_db_helper.dart';
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
      var taskTagDbHelper = new TaskTagDbHelper();
      var tagDbHelper = new TagDBHelper();
      var tasks = new List<TaskModel>();
      var tagIdsToSearch = new List<int>();

      Database db = await DBHelper.instance.database;
      final List<Map<String, dynamic>> dbTasks = await db.query(tableName);

      for(var task in dbTasks){

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
        );

        newTask.tags = new List<String>();

        final List<Map<String, dynamic>> dbTaskTags = await taskTagDbHelper.queryByTaskId(task[id]);

        for(var tag in dbTaskTags){
          tagIdsToSearch.add(tag["tag_id"]);
        }

        var tags = await tagDbHelper
          .queryByIds(tagIdsToSearch);
        tagIdsToSearch.clear(); // This is to make sure no other tags get added to the next Task

        tags.forEach(
          (row) {
            newTask.tags.add(row[TagDBHelper.name]);
          }
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