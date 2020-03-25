import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'tracked_event_model.g.dart';

@HiveType(typeId: 0)
class TrackedEventModel extends _TrackedEventModel with _$TrackedEventModel {
  TrackedEventModel({
    int id,
    String title,
    DateTime date,
    int elapsedTime,
    String unit,
  }) : super(
          id: id,
          title: title,
          date: date,
          elapsedTime: elapsedTime,
          unit: unit,
        );
}

abstract class _TrackedEventModel extends HiveObject with Store {
  @HiveField(0)
  int id;

  @HiveField(1)
  @observable
  String title;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  int elapsedTime;

  @HiveField(4)
  String unit;

  _TrackedEventModel({
    this.id,
    this.title,
    this.date,
    this.elapsedTime,
    this.unit,
  });
}
