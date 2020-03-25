import 'dart:async';

import 'package:mobx/mobx.dart';

part 'time_tracker_service.g.dart';

class TimeTrackerService extends _TimeTrackerServiceBase with _$TimeTrackerService {
  factory TimeTrackerService() {
    _instance ??= TimeTrackerService._internalConstructor();
    return _instance;
  }

  TimeTrackerService._internalConstructor();

  static _TimeTrackerServiceBase _instance;
}

abstract class _TimeTrackerServiceBase with Store {
  @observable
  int _hours = 0;
  @observable
  int _minutes = 0;
  @observable
  int _seconds = 0;
  @observable
  int _milliseconds = 0;
  Timer _timer;
  final Stopwatch _watch = Stopwatch();
  @observable
  bool _isRunning = false;

  void _updateTime(Timer timer) {
    if (_watch.isRunning) {
      _milliseconds = _watch.elapsed.inMilliseconds;
      _seconds = _watch.elapsed.inSeconds;
      _minutes = _watch.elapsed.inMinutes;
      _hours = _watch.elapsed.inHours;
    }
  }

  @action
  void stop() {
    _watch.stop();
    _isRunning = _watch.isRunning;
    _timer.cancel();
  }

  @action
  void start() {
    if (!_watch.isRunning) {
      _watch.start();
      _isRunning = _watch.isRunning;
      _timer = Timer.periodic(Duration(milliseconds: 1), _updateTime);
    }
  }

  @action
  void reset() {
    stop();
    _watch.reset();
    _milliseconds = 0;
    _seconds = 0;
    _minutes = 0;
    _hours = 0;
  }

  @computed
  bool get isRunning => _isRunning;
  @computed
  int get milliseconds => _milliseconds;
  @computed
  int get seconds => _seconds;
  @computed
  int get minutes => _minutes;
  @computed
  int get hours => _hours;
}
