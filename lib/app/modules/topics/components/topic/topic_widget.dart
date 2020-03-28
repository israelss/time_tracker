import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/topic_model.dart';
import '../../utils/dialogs/topics_dialogs.dart';
import '../../../../shared/utils/functions.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({this.model});

  final TopicModel model;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Dismissible(
        confirmDismiss: (DismissDirection direction) => confirmDismiss(
          direction: direction,
          onUpdateShow: UpdateTopicDialogWidget(model: model),
          onRemoveShow: RemoveTopicDialogWidget(id: model.id),
        ),
        background: buildBackground(),
        secondaryBackground: buildSecondaryBackground(),
        key: ObjectKey(model),
        child: ListTile(title: model.title.text.size(18).make()),
      ).card.elevation(5).color(Colors.grey.shade200).roundedLg.make();
    });
  }
}
