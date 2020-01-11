import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';

class TaskModel{
  int id;
  int groupId;
  int listId;
  int priorityId;
  String name;
  String description;
  int hasList;
  int hasReminder;
  int isComplete;
  int isArchived;
  List<String> tags = new List<String>();

  TaskModel ({
    this.id, 
    this.groupId,
    this.listId, 
    this.priorityId,
    this.name,
    this.description,
    this.hasList,
    this.hasReminder,
    this.isComplete,
    this.isArchived,
    this.tags
    });

    Map<String, dynamic> toMap(){
      return {
        TaskDBHelper.id : id,
        TaskDBHelper.groupId : groupId,
        TaskDBHelper.listId : listId,
        TaskDBHelper.priorityId : priorityId,
        TaskDBHelper.name : name,
        TaskDBHelper.description : description,
        TaskDBHelper.hasList : hasList,
        TaskDBHelper.hasReminder : hasReminder,
        TaskDBHelper.isComplete : isComplete,
        TaskDBHelper.isArchived : isArchived
      };      
    }
}