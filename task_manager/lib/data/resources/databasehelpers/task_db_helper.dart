import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/filter_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/filter_tag_db_helper.dart';
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
      // do an upsert for the task here
      return await db.insert(
        tableName, 
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
      );
    }

    // Updates a row in the database where the id is set in the model class
    Future<int> update(TaskModel task) async {
      Database db = await DBHelper.instance.database;
      await db.update(tableName, task.toMap(), where: '$id = ?', whereArgs: [task.id]);
      return task.id;
    }

    // Returns all of the rows in the database
    Future<List<TaskModel>> queryAllRows() async {
      var tasks = new List<TaskModel>();
      Database db = await DBHelper.instance.database;
      
      final List<Map<String, dynamic>> result = await db.query(tableName);

      await buildTasksAndTags(result).then((value) => tasks = value);

      return tasks;
    }

    Future<List<TaskModel>> queryByIds(List<int> ids) async{
      final db = await DBHelper.instance.database;
      var tasks = new List<TaskModel>();

      var result = await db.query(
        tableName,
        where: 'id IN (${ids.join(',')})'
      );

      await buildTasksAndTags(result).then((value) => tasks = value);

      return tasks;
    }

    Future<List<TaskModel>> queryAllRowsByFilter(String filterName) async {
      var filterDb = new FilterDbHelper();
      var filterTagDb = new FilterTagDbHelper();
      var taskTagDb = new TaskTagDbHelper();
      var filterId = -1;

      var tagIds = new List<int>();
      var taskIds = new List<int>();

      if(filterName == "All Tasks" || filterName == "" || filterName == null)
        return queryAllRows();

      await filterDb.queryByName(filterName).then((value) => filterId = value.id);

      if(filterId >= 0)
        await filterTagDb.queryByFilterId(filterId).then(
          (value){
            for(var item in value){
              tagIds.add(item["${FilterTagDbHelper.tagId}"]);
            }
          }
        );

      if(tagIds.length > 0)
        await taskTagDb.queryByTagIds(tagIds).then(
          (value) {
            for(var item in value)
              taskIds.add(item["${TaskTagDbHelper.taskId}"]);
          }
        );

      return queryByIds(taskIds);
    }

    // Delete a row from the database
    Future<int> delete(int idToDelete) async {
      Database db = await DBHelper.instance.database;
      return await db.delete(tableName, where: '$id = ?', whereArgs: [idToDelete]);
    }

    Future<List<TaskModel>> buildTasksAndTags(List<Map<String, dynamic>> rows) async{
      final taskTagDbHelper = new TaskTagDbHelper();
      final tagDbHelper = new TagDBHelper();
      var tasks = new List<TaskModel>();
      var tagIdsToSearch = new List<int>();

      for(var row in rows){
        var newTask = new TaskModel(
          id: row[id],
          groupId: row[groupId],
          listId: row[listId],
          priorityId: row[priorityId],
          name: row[name],
          description: row[description],
          hasList: row[hasList],
          hasReminder: row[hasReminder],
          isComplete: row[isComplete],
          isArchived: row[isArchived],
          tags: new List<String>()
        );

        final List<Map<String, dynamic>> dbTaskTags = await taskTagDbHelper.queryByTaskId(newTask.id);

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
}