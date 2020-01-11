import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';

class Repository{

  // Task
  final taskdbHelper = new TaskDBHelper();

  Future<List<TaskModel>> getAllTasks() => taskdbHelper.queryAllRows();

  Future<int> deleteSingleTask(int id) => taskdbHelper.delete(id);

  Future<int> insertSingleTask(TaskModel task) => taskdbHelper.insert(task);

  Future<void> updateSingleTask(Map<String, dynamic> row) => taskdbHelper.update(row);

  // Tags
  final tagdbHelper = new TagDBHelper();

  Future<int> insertSingleTag(row) => tagdbHelper.insert(row);

  // Priorities

  // Task checklist

  // Reminder

  // Application Settings
}