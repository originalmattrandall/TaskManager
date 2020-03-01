import 'package:task_manager/data/models/filter.dart';
import 'package:task_manager/data/repository.dart';

import 'package:rxdart/rxdart.dart';

class FilterBloc{
  final _repository = Repository();
  final _filterFetcher = PublishSubject<List<Filter>>();

  Observable<List<Filter>> get allFilters => _filterFetcher.stream;

  fetchAllFilters() async {
    List<Filter> filters = await _repository.getAllFilters();
    _filterFetcher.sink.add(filters);
  }  

  dispose(){
    _filterFetcher.close();
  }
}

final filterBloc = FilterBloc();