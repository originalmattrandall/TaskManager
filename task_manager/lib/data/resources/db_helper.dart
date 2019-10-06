import 'task_db_helper.dart';
import 'group_db_helper.dart';

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
        CREATE TABLE groups (
          ${GroupDBHelper.id} INTEGER PRIMARY KEY,
          ${GroupDBHelper.name} TEXT,
          ${GroupDBHelper.description} TEXT,
          ${GroupDBHelper.dueDate} TEXT
        )
      ''');
    }


    // Basic CRUD Operations

    // Inserts a row and returns the inserted rows id.
    Future<int> insert(Map<String, dynamic> row, String tableName) async{
      Database db = await instance.database;
      return await db.insert(tableName, row);
    }

    // Returns all of the rows in the database
    Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
      Database db = await instance.database;
      return await db.query(tableName);
    }

    // Updates a row in the database where the id is set in the model class
    Future<int> update(Map<String, dynamic> row, String tableName, String idField) async {
      Database db = await instance.database;
      int id = row[idField];
      return await db.update(tableName, row, where: '$idField = ?', whereArgs: [id]);
    }

    // Delete a row from the database
    Future<int> delete(int id, String tableName, String idField) async {
      Database db = await instance.database;
      return await db.delete(tableName, where: '$idField = ?', whereArgs: [id]);
    }
}