import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:time_tracker/app/modules/topics/components/topic/topic_widget.dart';
import 'package:time_tracker/app/modules/topics/topics_controller.dart';
import 'package:time_tracker/app/modules/topics/topics_module.dart';

TopicsController controller = TopicsModule.to.get<TopicsController>();

class TopicsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        // return AnimatedList(
        //   itemBuilder: (BuildContext context, int index, Animation<double> animation) {
        //     return TopicWidget(model: controller.list[index]);
        //   },
        //   initialItemCount: controller.list.length,
        // );
        return ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (_, index) => TopicWidget(model: controller.list[index]),
        );
      },
    );
  }
}
