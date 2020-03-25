import 'package:flutter_modular/flutter_modular.dart';
import 'package:time_tracker/app/modules/home/home_controller.dart';
import 'package:time_tracker/app/modules/home/home_page.dart';
import 'package:time_tracker/app/modules/topics/topics_module.dart';
import 'package:time_tracker/app/shared/services/local_storage_service.dart';
import 'package:time_tracker/app/shared/services/time_tracker_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(
              timeService: i.get<TimeTrackerService>(),
              storageService: i.get<LocalStorageService>(),
            )),
        Bind((i) => TimeTrackerService()),
        Bind((i) => LocalStorageService()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router(
          '/topicsList',
          module: TopicsModule(),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
