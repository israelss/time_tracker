// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_tracker_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TimeTrackerService on _TimeTrackerServiceBase, Store {
  Computed<bool> _$isRunningComputed;

  @override
  bool get isRunning =>
      (_$isRunningComputed ??= Computed<bool>(() => super.isRunning)).value;
  Computed<int> _$millisecondsComputed;

  @override
  int get milliseconds =>
      (_$millisecondsComputed ??= Computed<int>(() => super.milliseconds))
          .value;
  Computed<int> _$secondsComputed;

  @override
  int get seconds =>
      (_$secondsComputed ??= Computed<int>(() => super.seconds)).value;
  Computed<int> _$minutesComputed;

  @override
  int get minutes =>
      (_$minutesComputed ??= Computed<int>(() => super.minutes)).value;
  Computed<int> _$hoursComputed;

  @override
  int get hours => (_$hoursComputed ??= Computed<int>(() => super.hours)).value;

  final _$_hoursAtom = Atom(name: '_TimeTrackerServiceBase._hours');

  @override
  int get _hours {
    _$_hoursAtom.context.enforceReadPolicy(_$_hoursAtom);
    _$_hoursAtom.reportObserved();
    return super._hours;
  }

  @override
  set _hours(int value) {
    _$_hoursAtom.context.conditionallyRunInAction(() {
      super._hours = value;
      _$_hoursAtom.reportChanged();
    }, _$_hoursAtom, name: '${_$_hoursAtom.name}_set');
  }

  final _$_minutesAtom = Atom(name: '_TimeTrackerServiceBase._minutes');

  @override
  int get _minutes {
    _$_minutesAtom.context.enforceReadPolicy(_$_minutesAtom);
    _$_minutesAtom.reportObserved();
    return super._minutes;
  }

  @override
  set _minutes(int value) {
    _$_minutesAtom.context.conditionallyRunInAction(() {
      super._minutes = value;
      _$_minutesAtom.reportChanged();
    }, _$_minutesAtom, name: '${_$_minutesAtom.name}_set');
  }

  final _$_secondsAtom = Atom(name: '_TimeTrackerServiceBase._seconds');

  @override
  int get _seconds {
    _$_secondsAtom.context.enforceReadPolicy(_$_secondsAtom);
    _$_secondsAtom.reportObserved();
    return super._seconds;
  }

  @override
  set _seconds(int value) {
    _$_secondsAtom.context.conditionallyRunInAction(() {
      super._seconds = value;
      _$_secondsAtom.reportChanged();
    }, _$_secondsAtom, name: '${_$_secondsAtom.name}_set');
  }

  final _$_millisecondsAtom =
      Atom(name: '_TimeTrackerServiceBase._milliseconds');

  @override
  int get _milliseconds {
    _$_millisecondsAtom.context.enforceReadPolicy(_$_millisecondsAtom);
    _$_millisecondsAtom.reportObserved();
    return super._milliseconds;
  }

  @override
  set _milliseconds(int value) {
    _$_millisecondsAtom.context.conditionallyRunInAction(() {
      super._milliseconds = value;
      _$_millisecondsAtom.reportChanged();
    }, _$_millisecondsAtom, name: '${_$_millisecondsAtom.name}_set');
  }

  final _$_isRunningAtom = Atom(name: '_TimeTrackerServiceBase._isRunning');

  @override
  bool get _isRunning {
    _$_isRunningAtom.context.enforceReadPolicy(_$_isRunningAtom);
    _$_isRunningAtom.reportObserved();
    return super._isRunning;
  }

  @override
  set _isRunning(bool value) {
    _$_isRunningAtom.context.conditionallyRunInAction(() {
      super._isRunning = value;
      _$_isRunningAtom.reportChanged();
    }, _$_isRunningAtom, name: '${_$_isRunningAtom.name}_set');
  }

  final _$_TimeTrackerServiceBaseActionController =
      ActionController(name: '_TimeTrackerServiceBase');

  @override
  void stop() {
    final _$actionInfo =
        _$_TimeTrackerServiceBaseActionController.startAction();
    try {
      return super.stop();
    } finally {
      _$_TimeTrackerServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void start() {
    final _$actionInfo =
        _$_TimeTrackerServiceBaseActionController.startAction();
    try {
      return super.start();
    } finally {
      _$_TimeTrackerServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo =
        _$_TimeTrackerServiceBaseActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$_TimeTrackerServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isRunning: ${isRunning.toString()},milliseconds: ${milliseconds.toString()},seconds: ${seconds.toString()},minutes: ${minutes.toString()},hours: ${hours.toString()}';
    return '{$string}';
  }
}
