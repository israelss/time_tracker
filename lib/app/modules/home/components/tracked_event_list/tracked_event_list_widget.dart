import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:time_tracker/app/modules/home/components/tracked_event/tracked_event_widget.dart';
import 'package:time_tracker/app/modules/home/home_controller.dart';
import 'package:time_tracker/app/modules/home/home_module.dart';

HomeController controller = HomeModule.to.get<HomeController>();

class TrackedEventListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (_, index) => TrackedEventWidget(model: controller.list[index]),
        );
      },
    );
  }
}
