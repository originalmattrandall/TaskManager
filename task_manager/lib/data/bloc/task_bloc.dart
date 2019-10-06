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

  dispose(){
    _taskFetcher.close();
  }
}

final taskBloc = TaskBloc();