import 'package:task_manager/data/models/group.dart';

import 'db_helper.dart';

import 'package:sqflite/sqflite.dart';

class GroupDBHelper{
  static final tableName = "groups";

  // Column names
  static final id = "id";
  static final name = "name";
  static final description = "description";
  static final dueDate = "due_date";

  // Reference to our single dbhelper
  final dbHelper = DBHelper.instance;

  // Inserts a row and returns the inserted rows id.
  Future<void> insert(GroupModel group) async{
    Database db = await DBHelper.instance.database;
    await db.insert(
      tableName, 
      group.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  // Returns all of the rows in the database
  Future<List<GroupModel>> queryAllRows() async {
    Database db = await DBHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
        return GroupModel(
          id: maps[i][id],
          name: maps[i][name],
          description: maps[i][description],
          dueDate: maps[i][dueDate],
        );
      });
  }

  // Updates a row in the database where the id is set in the model class
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await dbHelper.database;
    int idOfRow = row[id];
    return await db.update(tableName, row, where: '$id = ?', whereArgs: [idOfRow]);
  }

  // Delete a row from the database
  Future<int> delete(int idToDelete) async {
    Database db = await dbHelper.database;
    return await db.delete(tableName, where: '$id = ?', whereArgs: [idToDelete]);
  }
}