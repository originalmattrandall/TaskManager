import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';

class Repository{

  // Task
  final taskdbHelper = new TaskDBHelper();

  Future<List<TaskModel>> getAllTasks() => taskdbHelper.queryAllRows();

  Future<int> deleteSingleTask(int id) => taskdbHelper.delete(id);

  Future<void> insertSingleTask(TaskModel task) => taskdbHelper.insert(task);

  // Group

  // Priorities

  // Task checklist

  // Reminder

  // Application Settings
}