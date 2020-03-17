import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/repository.dart';

import 'package:rxdart/rxdart.dart';

class TaskBloc{
  final _repository = Repository();
  final _taskFetcher = PublishSubject<List<TaskModel>>();

  Observable<List<TaskModel>> get allTasks => _taskFetcher.stream;

  fetchAllTasks() async {
    List<TaskModel> taskModel = await _repository.getAllTasks();
    _taskFetcher.sink.add(taskModel);
  }

  fetchAllTasksByFilter(String filterName) async {
    List<TaskModel> taskModel = await _repository.getAllRowsByFilter(filterName);
    _taskFetcher.sink.add(taskModel);
  }

  Future<int> insertSingleTask(TaskModel task) async {
    var id = await _repository.insertSingleTask(task);
    fetchAllTasks();
    return id;
  }

  updateSingleTask(Map<String, dynamic> row) async {
    await _repository.updateSingleTask(row);
    fetchAllTasks();
  }

  deleteSingleTask(int id) async {
    await _repository.deleteSingleTask(id);
    fetchAllTasks();
  }

  deleteAssociatedTags(int id) async {
    await _repository.deleteAssociatedTags(id);
    fetchAllTasks();
  }

  dispose(){
    _taskFetcher.close();
  }
}

final taskBloc = TaskBloc();