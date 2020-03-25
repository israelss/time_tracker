import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:time_tracker/app/app_controller.dart';
import 'package:time_tracker/app/app_widget.dart';
import 'package:time_tracker/app/modules/home/home_module.dart';
import 'package:time_tracker/app/shared/services/topics_db_service.dart';
import 'package:time_tracker/app/shared/services/tracked_events_db_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => TopicsDBService()),
        Bind((i) => TrackedEventsDBService()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
