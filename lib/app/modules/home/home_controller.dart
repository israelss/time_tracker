import 'package:mobx/mobx.dart';

import 'models/tracked_event_model.dart';
import '../../modules/topics/models/topic_model.dart';
import '../../shared/services/db/local_storage_service.dart';
import '../../shared/services/time_tracker_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final TimeTrackerService timeService;
  final LocalStorageService storageService;

  _HomeControllerBase({this.storageService, this.timeService});

  // TIME SERVICE ACTIONS
  @action
  void startTimer() => timeService.start();
  @action
  void resetTimer() => timeService.reset();
  @action
  void stopTimer() => timeService.stop();

  // TIME SERVICE COMPUTEDS
  @computed
  bool get hasElapsedTime => timeService.milliseconds != 0;
  @computed
  int get getElapsedTime {
    switch (_unit) {
      case 'ms':
        return timeService.milliseconds;
        break;
      case 's':
        return timeService.seconds;
        break;
      case 'm':
        return timeService.minutes;
        break;
      case 'h':
        return timeService.hours;
        break;
      default:
        return timeService.minutes;
    }
  }

  @computed
  bool get timerIsRunning => timeService.isRunning;
  @computed
  bool get isPaused => !timerIsRunning && hasElapsedTime;

  // EVENTS ACTIONS
  @action
  Future<TrackedEventModel> addEvent(TrackedEventModel model) async => await storageService.events.add(model);
  @action
  Future<TrackedEventModel> update(TrackedEventModel model) async => await storageService.events.update(model);
  @action
  Future<void> remove(int id) async => await storageService.events.remove(id);

  // EVENTS COMPUTEDS
  @computed
  ObservableList<TrackedEventModel> get list => storageService.events.list;
  @computed
  int get getEventListLength => storageService.events.list.length;

  // TOPICS ACTIONS
  @action
  Future<String> addTopic(String topicTitle) async {
    TopicModel model = TopicModel(id: null, title: topicTitle);
    return await storageService.topics.add(model).then(
          (result) => result.fold(
            (failure) => '',
            (model) => '\n\nTópico adicionado: ${model.title}',
          ),
        );
  }

  // TOPICS COMPUTEDS
  @computed
  ObservableList<String> get topicsList => storageService.topics.list.map((item) => item.title).toList().asObservable();

  // UNIT
  List<String> _units = ['ms', 's', 'm', 'h'];
  int _nextUnit = 2;

  @action
  changeUnit() {
    _nextUnit = (_nextUnit + 1) == _units.length ? 0 : _nextUnit + 1;
    _unit = _units[_nextUnit];
  }

  @observable
  String _unit = 'm';

  @computed
  String get unit => _unit;
}
