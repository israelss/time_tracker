// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topics_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TopicsController on _TopicsControllerBase, Store {
  Computed<ObservableList<TopicModel>> _$listComputed;

  @override
  ObservableList<TopicModel> get list => (_$listComputed ??=
          Computed<ObservableList<TopicModel>>(() => super.list))
      .value;

  final _$addAsyncAction = AsyncAction('add');

  @override
  Future<Either<Failure, TopicModel>> add(TopicModel model) {
    return _$addAsyncAction.run(() => super.add(model));
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<Either<Failure, TopicModel>> update(
      TopicModel model, String oldTitle) {
    return _$updateAsyncAction.run(() => super.update(model, oldTitle));
  }

  final _$_TopicsControllerBaseActionController =
      ActionController(name: '_TopicsControllerBase');

  @override
  void remove(int id) {
    final _$actionInfo = _$_TopicsControllerBaseActionController.startAction();
    try {
      return super.remove(id);
    } finally {
      _$_TopicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAll() {
    final _$actionInfo = _$_TopicsControllerBaseActionController.startAction();
    try {
      return super.removeAll();
    } finally {
      _$_TopicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'list: ${list.toString()}';
    return '{$string}';
  }
}
