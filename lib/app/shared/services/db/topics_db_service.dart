import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../../../modules/topics/models/topic_model.dart';
import '../../models/failure.dart';

Completer<Box<TopicModel>> topicModelCompleter = Completer<Box<TopicModel>>();
ObservableList<TopicModel> _list = ObservableList<TopicModel>();

class TopicsDBService {
  initDB() async {
    Hive.registerAdapter(TopicModelAdapter());
    final topicsBox = await Hive.openBox<TopicModel>('topics');
    if (!topicModelCompleter.isCompleted) {
      topicModelCompleter.complete(topicsBox);
      _list.addAll(topicsBox.values.toList()..sort((a, b) => a.title.compareTo(b.title)));
    }
  }

  Future<Either<Failure, TopicModel>> add(TopicModel model) async {
    final topicsBox = await topicModelCompleter.future;
    model.title = model.title.trim();
    if (topicsBox.values.map((topic) => topic.title).contains(model.title)) {
      return left(Failure('Este tópico já existe!'));
    }
    model.id = topicsBox.length;
    topicsBox.put(model.id, model);
    _list.add(model);
    _list.sort((a, b) => a.title.compareTo(b.title));
    return right(model);
  }

  Future<Either<Failure, TopicModel>> update(TopicModel model, String oldTitle) async {
    final topicsBox = await topicModelCompleter.future;
    if (topicsBox.values.map((topic) => topic.title).where((title) => title == model.title).length > 1) {
      model.title = oldTitle;
      topicsBox.put(model.id, model);
      return left(Failure('Este tópico já existe!'));
    } else {
      model.title = model.title.trim();
      topicsBox.put(model.id, model);
      _list[_list.indexWhere((item) => item.id == model.id)] = model;
      _list.sort((a, b) => a.title.compareTo(b.title));
      return right(model);
    }
  }

  void remove(int id) async {
    final topicsBox = await topicModelCompleter.future;
    await topicsBox.delete(id);
    _list.removeWhere((item) => item.id == id);
  }

  void removeAll() async {
    final topicsBox = await topicModelCompleter.future;
    await topicsBox.clear();
    _list.clear();
  }

  @computed
  ObservableList<TopicModel> get list => _list;
}
