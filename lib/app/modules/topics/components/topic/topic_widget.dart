import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:time_tracker/app/shared/models/topic_model.dart';
import 'package:time_tracker/app/shared/utils/functions.dart';
import 'package:velocity_x/velocity_x.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({this.model});

  final TopicModel model;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Dismissible(
        confirmDismiss: (DismissDirection direction) => confirmDismiss(direction, model, Scope.TOPICS),
        background: buildBackground(), // What to show when swiping left to right -->
        secondaryBackground: buildSecondaryBackground(), // What to show when swiping right to left <--
        key: ObjectKey(model),
        child: ListTile(title: model.title.text.size(18).make()),
      ).card.elevation(5).color(Colors.grey.shade200).roundedLg.make();
    });
  }
}
