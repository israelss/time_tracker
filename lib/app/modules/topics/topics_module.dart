import 'package:flutter_modular/flutter_modular.dart';
import 'package:time_tracker/app/modules/topics/topics_controller.dart';
import 'package:time_tracker/app/modules/topics/topics_page.dart';
import 'package:time_tracker/app/shared/services/topics_db_service.dart';

class TopicsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TopicsController(i.get<TopicsDBService>())),
        Bind((i) => TopicsDBService()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => TopicsPage(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<TopicsModule>.of();
}
