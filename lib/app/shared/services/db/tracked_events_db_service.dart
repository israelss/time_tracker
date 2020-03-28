import 'dart:async';
import '../../../modules/home/models/tracked_event_model.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

Completer<Box<TrackedEventModel>> trackedEventModelCompleter = Completer<Box<TrackedEventModel>>();
ObservableList<TrackedEventModel> _list = ObservableList<TrackedEventModel>();

class TrackedEventsDBService {
  initDB() async {
    Hive.registerAdapter(TrackedEventModelAdapter());
    final trackedEventsBox = await Hive.openBox<TrackedEventModel>('trackedEvents');
    if (!trackedEventModelCompleter.isCompleted) {
      trackedEventModelCompleter.complete(trackedEventsBox);
      _list.addAll(trackedEventsBox.values.toList().reversed);
    }
  }

  Future<TrackedEventModel> add(TrackedEventModel model) async {
    final eventsBox = await trackedEventModelCompleter.future;
    model.title = model.title.trim();
    model.id = eventsBox.length;
    eventsBox.put(model.id, model);
    _list.insert(0, model);
    return model;
  }

  Future<TrackedEventModel> update(TrackedEventModel model) async {
    final eventsBox = await trackedEventModelCompleter.future;
    model.title = model.title.trim();
    eventsBox.put(model.id, model);
    _list[_list.indexWhere((item) => item.id == model.id)] = model;
    return model;
  }

  Future<void> remove(int id) async {
    final eventsBox = await trackedEventModelCompleter.future;
    await eventsBox.delete(id);
    _list.removeWhere((item) => item.id == id);
  }

  @computed
  ObservableList<TrackedEventModel> get list => _list;
}
