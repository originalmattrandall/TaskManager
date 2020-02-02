import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class TagDBHelper{
  static final tableName = "tag";

  // Column Names for the Task table
  static final id = "id";
  static final name = "name";

  // Reference to our single dbhelper
  final dbHelper = DBHelper.instance;

  // Inserts a row and returns the inserted rows id, Only inserts rows where the name is unique
  Future<int> upsert(Map<String, dynamic> row) async{
    Database db = await dbHelper.database;

    int length = 0;
    await queryRowsByName(row["name"])
    .then(
      (value) {
        length = value.length;
      }
    );

    if(length > 0){
      return db.update(
        tableName, 
        row,
        where: "name = ?",
        whereArgs: [row["name"]]
      );
    }
    else{
      return db.insert(tableName, row);
    }
  }

  // Returns all of the rows in the database
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await dbHelper.database;
    return await db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> queryByIds(List<int> ids) async{
    Database db = await dbHelper.database;
    return db.query(
      tableName,
      where: 'id IN (${ids.join(',')})'
      //whereArgs: ids
    );
  }

  // Returns all rows where the tag name matches the passed value
  Future<List<Map<String, dynamic>>> queryRowsByName(String name) async{
    Database db = await dbHelper.database;
    return db.query(
      tableName,
      where: 'name = ?',
      whereArgs: [name]
    );
  }

  // // Updates a row in the database where the id is set in the model class
  // Future<List<Map<String, dynamic>>> queryByTaskId(int id) async {
  //   Database db = await dbHelper.database;
  //   return await db.query(
  //     tableName,
  //     distinct:true,
  //     where: '$taskId = ?', 
  //     whereArgs: [id]);
  // }
}