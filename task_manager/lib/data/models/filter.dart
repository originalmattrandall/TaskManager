import 'package:task_manager/data/resources/databasehelpers/filter_db_helper.dart';

class Filter{
  int id;
  String name;
  String description;

  Filter({
    this.id,
    this.name,
    this.description
  });

  Map<String, dynamic> toMap(){
    return {
      FilterDbHelper.id: id,
      FilterDbHelper.name: name,
      FilterDbHelper.description: description
    };      
  }
}