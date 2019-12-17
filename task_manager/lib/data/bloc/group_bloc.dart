import 'package:task_manager/data/models/group.dart';
import 'package:task_manager/data/repository.dart';
import 'package:rxdart/rxdart.dart';

class GroupBloc{
  final _repository = Repository();
  final _taskFetcher = PublishSubject<List<GroupModel>>();

  Observable<List<GroupModel>> get allTasks => _taskFetcher.stream;

  fetchAllGroups() async {
    List<GroupModel> results = await _repository.getAllGroups();
    _taskFetcher.sink.add(results);
  }

  insertSingleGroup(GroupModel group) async {
    await _repository.insertSingleGroup(group);
    fetchAllGroups();
  }

  dispose(){
    _taskFetcher.close();
  }
}

final groupBloc = GroupBloc();