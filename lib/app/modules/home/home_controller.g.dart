// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$hasElapsedTimeComputed;

  @override
  bool get hasElapsedTime =>
      (_$hasElapsedTimeComputed ??= Computed<bool>(() => super.hasElapsedTime))
          .value;
  Computed<int> _$getElapsedTimeComputed;

  @override
  int get getElapsedTime =>
      (_$getElapsedTimeComputed ??= Computed<int>(() => super.getElapsedTime))
          .value;
  Computed<bool> _$timerIsRunningComputed;

  @override
  bool get timerIsRunning =>
      (_$timerIsRunningComputed ??= Computed<bool>(() => super.timerIsRunning))
          .value;
  Computed<bool> _$isPausedComputed;

  @override
  bool get isPaused =>
      (_$isPausedComputed ??= Computed<bool>(() => super.isPaused)).value;
  Computed<ObservableList<TrackedEventModel>> _$listComputed;

  @override
  ObservableList<TrackedEventModel> get list => (_$listComputed ??=
          Computed<ObservableList<TrackedEventModel>>(() => super.list))
      .value;
  Computed<int> _$getEventListLengthComputed;

  @override
  int get getEventListLength => (_$getEventListLengthComputed ??=
          Computed<int>(() => super.getEventListLength))
      .value;
  Computed<ObservableList<String>> _$topicsListComputed;

  @override
  ObservableList<String> get topicsList => (_$topicsListComputed ??=
          Computed<ObservableList<String>>(() => super.topicsList))
      .value;
  Computed<String> _$unitComputed;

  @override
  String get unit =>
      (_$unitComputed ??= Computed<String>(() => super.unit)).value;

  final _$_unitAtom = Atom(name: '_HomeControllerBase._unit');

  @override
  String get _unit {
    _$_unitAtom.context.enforceReadPolicy(_$_unitAtom);
    _$_unitAtom.reportObserved();
    return super._unit;
  }

  @override
  set _unit(String value) {
    _$_unitAtom.context.conditionallyRunInAction(() {
      super._unit = value;
      _$_unitAtom.reportChanged();
    }, _$_unitAtom, name: '${_$_unitAtom.name}_set');
  }

  final _$addEventAsyncAction = AsyncAction('addEvent');

  @override
  Future<TrackedEventModel> addEvent(TrackedEventModel model) {
    return _$addEventAsyncAction.run(() => super.addEvent(model));
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<TrackedEventModel> update(TrackedEventModel model) {
    return _$updateAsyncAction.run(() => super.update(model));
  }

  final _$removeAsyncAction = AsyncAction('remove');

  @override
  Future<void> remove(int id) {
    return _$removeAsyncAction.run(() => super.remove(id));
  }

  final _$addTopicAsyncAction = AsyncAction('addTopic');

  @override
  Future<String> addTopic(String topicTitle) {
    return _$addTopicAsyncAction.run(() => super.addTopic(topicTitle));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void startTimer() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.startTimer();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTimer() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.resetTimer();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.stopTimer();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUnit() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeUnit();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'hasElapsedTime: ${hasElapsedTime.toString()},getElapsedTime: ${getElapsedTime.toString()},timerIsRunning: ${timerIsRunning.toString()},isPaused: ${isPaused.toString()},list: ${list.toString()},getEventListLength: ${getEventListLength.toString()},topicsList: ${topicsList.toString()},unit: ${unit.toString()}';
    return '{$string}';
  }
}
