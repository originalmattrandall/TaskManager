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
    final db = await dbHelper.database;

    int length = 0;
    await queryRowsByName(row[name])
      .then(
        (value) {
          length = value.length;
        }
      );

    if(length > 0){
      var updatedId = 0;

      await db.update(
        tableName, 
        row,
        where: "$name = ?",
        whereArgs: [row[name]]
      ).then(
        (value) async {
          await queryRowsByName(row[name]).then(
            (value){
              updatedId = value[0][id];
            }
          );
        }
      );
      return updatedId;
    }
    else{
      return db.insert(tableName, row);
    }
  }

  // Returns all of the rows in the database
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await dbHelper.database;
    return await db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> queryByIds(List<int> ids) async{
    final db = await dbHelper.database;
    return db.query(
      tableName,
      where: 'id IN (${ids.join(',')})'
    );
  }

  // Returns all rows where the tag name matches the passed value
  Future<List<Map<String, dynamic>>> queryRowsByName(String name) async{
    final db = await dbHelper.database;
    return db.query(
      tableName,
      where: 'name = ?',
      whereArgs: [name]
    );
  }
}