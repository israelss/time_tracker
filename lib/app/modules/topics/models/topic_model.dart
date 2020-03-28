import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'topic_model.g.dart';

@HiveType(typeId: 1)
class TopicModel extends _TopicModel with _$TopicModel {
  TopicModel({
    id,
    title,
  }) : super(
          id: id,
          title: title,
        );
}

abstract class _TopicModel extends HiveObject with Store {
  @HiveField(0)
  int id;

  @HiveField(1)
  @observable
  String title;

  _TopicModel({
    this.id,
    this.title,
  });
}
