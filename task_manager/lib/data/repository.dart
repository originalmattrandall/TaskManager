import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/filter_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';

import 'models/filter.dart';

class Repository{

  // Task
  final taskdbHelper = new TaskDBHelper();

  Future<List<TaskModel>> getAllTasks() => taskdbHelper.queryAllRows();

  Future<List<TaskModel>> getAllRowsByFilter(String filterName) => taskdbHelper.queryAllRowsByFilter(filterName);

  Future<int> deleteSingleTask(int id) => taskdbHelper.delete(id);

  Future<int> insertSingleTask(TaskModel task) => taskdbHelper.insert(task);

  Future<void> updateSingleTask(Map<String, dynamic> row) => taskdbHelper.update(row);

  // Tags
  final tagdbHelper = new TagDBHelper();

  Future<int> insertSingleTag(row) => tagdbHelper.upsert(row);

  // Filters
  final filterdbHelper = new FilterDbHelper();

  Future<List<Filter>> getAllFilters() => filterdbHelper.queryAllRows();
  
  // Priorities

  // Task checklist

  // Reminder

  // Application Settings
}