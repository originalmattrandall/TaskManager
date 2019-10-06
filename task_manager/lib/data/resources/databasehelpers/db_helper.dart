import 'listitem_db_helper.dart';
import 'reminder_db_helper.dart';
import 'task_db_helper.dart';
import 'group_db_helper.dart';
import 'priority_db_helper.dart';

import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{
    static final _databaseName = ".db";
    static final _databaseVersion = 1;

    DBHelper._privateConstructor();
    static final DBHelper instance = DBHelper._privateConstructor();

    // Only have a single app-wide reference to this database
    static Database _database;
    Future<Database> get database async {
      if(_database != null) return _database;

      _database = await _initDatabase();
      return _database;
    }

    // Initializes the database if it does not exist
    _initDatabase() async{
      Directory documentsDirectory =  await getApplicationDocumentsDirectory();

      String path = join(documentsDirectory.path, _databaseName);

      return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate
      );
    }

    // Creates all the tables for the database
    Future _onCreate(Database db, int version) async{
      // Creates the task table
      await db.execute('''
        CREATE TABLE ${TaskDBHelper.tableName} (
          ${TaskDBHelper.id} INTEGER PRIMARY KEY,
          ${TaskDBHelper.groupId} INTEGER,
          ${TaskDBHelper.listId} INTEGER,
          ${TaskDBHelper.priorityId} INTEGER,
          ${TaskDBHelper.name} TEXT,
          ${TaskDBHelper.description} TEXT,
          ${TaskDBHelper.hasList} INTEGER,
          ${TaskDBHelper.hasReminder} INTEGER,
          ${TaskDBHelper.isComplete} INTEGER,
          ${TaskDBHelper.isArchived} INTEGER
        )
      ''');

      // Creates the group table
      await db.execute('''
        CREATE TABLE ${GroupDBHelper.tableName} (
          ${GroupDBHelper.id} INTEGER PRIMARY KEY,
          ${GroupDBHelper.name} TEXT,
          ${GroupDBHelper.description} TEXT,
          ${GroupDBHelper.dueDate} TEXT
        )
      ''');

      // Creates the task list items table
      await db.execute('''
        CREATE TABLE ${ListItemDBHelper.tableName} (
          ${ListItemDBHelper.id} INTEGER PRIMARY KEY,
          ${ListItemDBHelper.taskId} INTEGER,
          ${ListItemDBHelper.name} INTEGER,
          ${ListItemDBHelper.isComplete} INTEGER
        )
      ''');

      // Creates the table for the priority levels
      await db.execute('''
        CREATE TABLE ${PriorityDBHelper.tableName} (
          ${PriorityDBHelper.id} INTEGER PRIMARY KEY,
          ${PriorityDBHelper.name} TEXT,
          ${PriorityDBHelper.colorCode} TEXT,
          ${PriorityDBHelper.level} INTEGER
        )
      ''');

      await db.execute('''
        CREATE TABLE ${ReminderDBHelper.tableName} (
          ${ReminderDBHelper.id} INTEGER PRIMARY KEY,
          ${ReminderDBHelper.taskId} INTEGER,
          ${ReminderDBHelper.type} TEXT,
          ${ReminderDBHelper.triggerTime} TEXT,
          ${ReminderDBHelper.dayOfWeek} INTEGER
        )
      ''');
    }
}