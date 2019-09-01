class Task{
  int id;
  int groupId;
  int listId;
  int priorityId;
  String title;
  String description;
  int hasList;
  int hasReminder;
  int isComplete;
  int isArchived;

  Task({this.id, 
    this.groupId, 
    this.listId, 
    this.priorityId, 
    this.title, 
    this.description, 
    this.hasList, 
    this.hasReminder, 
    this.isArchived,
    this.isComplete
  });

}