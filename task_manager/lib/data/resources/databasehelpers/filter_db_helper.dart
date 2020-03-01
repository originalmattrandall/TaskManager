import 'package:sqflite/sqflite.dart';
import 'package:task_manager/data/models/filter.dart';
import 'package:task_manager/data/resources/databasehelpers/filter_tag_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'db_helper.dart';

class FilterDbHelper{
  static final tableName = "filter";

  // Column Names for the Task table
  static final id = "id";
  static final name = "name";
  static final description = "description";

  // Reference to our single dbhelper
  final dbHelper = DBHelper.instance;

  Future<List<Filter>> queryAllRows() async {
    Database db = await dbHelper.database;

    var filters = await db.query(tableName);
    
    return List.generate(filters.length, (i){
      return Filter(
        id: filters[i][id],
        name: filters[i][name],
        description: filters[i][description]
      );
    });
  }

  Future<Filter> queryByName(String nameToFind) async{
    final db = await dbHelper.database;

    var result = await db.query(
        tableName,
        where: '$name = ?',
        whereArgs: [nameToFind]
      );
    
    return result.length >= 1 ? Filter(
      id: result[0][id],
      name: result[0][name],
      description: result[0][description]
    ) : null;
  }

  // Inserts a row and returns the inserted rows id.
  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await dbHelper.database;
    return await db.insert(tableName, row);
  }

  // Inserts a row and returns the inserted rows id.
  Future<void> insertWithTags(Map<String, dynamic> row, List<String> tags) async{
    var filterTagDb = "${FilterTagDbHelper.tableName}";
    var tagDb = new TagDBHelper();

    Database db = await dbHelper.database;
    await db.insert(tableName, row).then(
      (filterId) async {
        for(var tag in tags){
          var tagId = await tagDb.queryRowsByName(tag);

          var filterTagRow = {
            FilterTagDbHelper.filterId : filterId,
            FilterTagDbHelper.tagId : tagId[0][TagDBHelper.id]
          };
          
          await db.insert(filterTagDb, filterTagRow);
        }
      }
    );
  }

  Future<void> clearDatabase() async {
    final db = await dbHelper.database;
    await db.delete(tableName);
  }
}