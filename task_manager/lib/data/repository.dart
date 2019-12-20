import 'package:task_manager/data/models/group.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/group_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';

class Repository{

  // Task
  final taskdbHelper = new TaskDBHelper();
  final groupdbHelper = new GroupDBHelper();

  Future<List<TaskModel>> getAllTasks() => taskdbHelper.queryAllRows();
  Future<List<GroupModel>> getAllGroups() => groupdbHelper.queryAllRows();

  Future<int> deleteSingleTask(int id) => taskdbHelper.delete(id);

  Future<void> insertSingleTask(TaskModel task) => taskdbHelper.insert(task);
  Future<void> insertSingleGroup(GroupModel group) => groupdbHelper.insert(group);

  Future<void> updateSingleTask(Map<String, dynamic> row) => taskdbHelper.update(row);

  // Group

  // Priorities

  // Task checklist

  // Reminder

  // Application Settings
}