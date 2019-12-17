import 'package:task_manager/data/resources/databasehelpers/group_db_helper.dart';

class GroupModel{
  int id;
  String name;
  String description;
  DateTime dueDate;

  GroupModel({
    this.id,
    this.name,
    this.description,
    this.dueDate
  });

  Map<String, dynamic> toMap(){
    return {
      GroupDBHelper.id : id,
      GroupDBHelper.name : name,
      GroupDBHelper.description : description,
      GroupDBHelper.dueDate : dueDate,
    };
  }
}