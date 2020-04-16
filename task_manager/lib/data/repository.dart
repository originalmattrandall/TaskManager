import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/filter_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_tag_db_helper.dart';

import 'models/filter.dart';

class Repository{

  // Task
  final taskdbHelper = new TaskDBHelper();
  final taskTagDbHelper = new TaskTagDbHelper();

  Future<List<TaskModel>> getAllTasks() => taskdbHelper.queryAllRows();

  Future<List<TaskModel>> getAllRowsByFilter(String filterName) => taskdbHelper.queryAllRowsByFilter(filterName);

  Future<int> deleteSingleTask(int id) => taskdbHelper.delete(id);

  Future<void> deleteAssociatedTags(int id) => taskTagDbHelper.deleteAllByTaskId(id);

  Future<int> insertSingleTask(TaskModel task) => taskdbHelper.insert(task);

  Future<int> updateSingleTask(TaskModel task) => taskdbHelper.update(task);

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