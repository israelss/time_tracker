import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import 'models/topic_model.dart';
import 'topics_module.dart';
import '../../shared/services/db/topics_db_service.dart';
import '../../shared/models/failure.dart';

part 'topics_controller.g.dart';

TopicsDBService topicsController = TopicsModule.to.get<TopicsDBService>();

class TopicsController = _TopicsControllerBase with _$TopicsController;

abstract class _TopicsControllerBase with Store {
  final TopicsDBService service;

  _TopicsControllerBase(this.service);

  @action
  Future<Either<Failure, TopicModel>> add(TopicModel model) async => await service.add(model);

  @action
  Future<Either<Failure, TopicModel>> update(TopicModel model, String oldTitle) async => await service.update(model, oldTitle);

  @action
  void remove(int id) => service.remove(id);

  @action
  void removeAll() => service.removeAll();

  @computed
  ObservableList<TopicModel> get list => service.list;
}
