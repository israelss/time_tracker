import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:time_tracker/app/modules/topics/topics_module.dart';
import 'package:time_tracker/app/shared/models/failure.dart';
import 'package:time_tracker/app/shared/models/topic_model.dart';
import 'package:time_tracker/app/shared/services/topics_db_service.dart';

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
