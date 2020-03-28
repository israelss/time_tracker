import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'topics_db_service.dart';
import 'tracked_events_db_service.dart';

class LocalStorageService extends Disposable {
  LocalStorageService() {
    _initDB();
  }

  TrackedEventsDBService events = Modular.get<TrackedEventsDBService>();

  TopicsDBService topics = Modular.get<TopicsDBService>();

  _initDB() async => await Hive.initFlutter().then((value) => events.initDB()).then((value) => topics.initDB());

  @override
  Future<void> dispose() async => await Hive.close();
}
