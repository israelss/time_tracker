import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/topics/topics_module.dart';
import '../../shared/services/db/local_storage_service.dart';
import '../../shared/services/time_tracker_service.dart';
import 'home_controller.dart';
import 'home_page.dart';

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
