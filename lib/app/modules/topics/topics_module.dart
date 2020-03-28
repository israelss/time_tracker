import 'package:flutter_modular/flutter_modular.dart';

import 'topics_controller.dart';
import 'topics_page.dart';
import '../../shared/services/db/topics_db_service.dart';

class TopicsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TopicsController(Modular.get<TopicsDBService>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => TopicsPage(), transition: TransitionType.fadeIn),
      ];

  static Inject get to => Inject<TopicsModule>.of();
}
