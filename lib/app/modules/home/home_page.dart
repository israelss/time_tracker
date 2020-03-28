import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'components/bottom_bar/bottom_bar_widget.dart';
import 'components/tracked_event/tracked_event_widget.dart';
import 'home_controller.dart';
import 'home_module.dart';

final HomeController controller = HomeModule.to.get<HomeController>();

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title = "Time Tracker"});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          FlatButton(
            color: Colors.green,
            onPressed: () => Get.toNamed('/topicsList'),
            child: 'Tópicos'.text.size(15).wide.make(),
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (_, index) => TrackedEventWidget(model: controller.list[index]),
          );
        },
      ),
      bottomNavigationBar: BottomBarWidget(),
      floatingActionButton: Observer(builder: (_) {
        return AnimatedOpacity(
            duration: kFloatingActionButtonSegue,
            opacity: !controller.timerIsRunning && controller.hasElapsedTime ? 1.0 : 0.0,
            child: Visibility(
              visible: !controller.timerIsRunning,
              child: FloatingActionButton(
                onPressed: controller.resetTimer,
                child: Icon(Icons.restore),
                backgroundColor: Colors.redAccent,
              ),
            ));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
