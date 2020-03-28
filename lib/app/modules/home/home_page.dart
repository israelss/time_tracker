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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Time Tracker'),
        actions: <Widget>[
          FlatButton(
            color: Colors.green,
            onPressed: () => Get.toNamed('/topicsList'),
            child: const Text('Tópicos').text.size(15).wide.make(),
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
      bottomNavigationBar: const BottomBarWidget(),
      floatingActionButton: Observer(builder: (_) {
        return AnimatedOpacity(
            duration: kFloatingActionButtonSegue,
            opacity: controller.isPaused ? 1.0 : 0.0,
            child: FloatingActionButton(
              heroTag: 'resetFab',
              onPressed: controller.isPaused ? controller.resetTimer : null,
              child: const Icon(Icons.restore),
              backgroundColor: Colors.redAccent,
            ));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
