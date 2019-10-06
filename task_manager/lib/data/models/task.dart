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
    this.isArchived
    });
}