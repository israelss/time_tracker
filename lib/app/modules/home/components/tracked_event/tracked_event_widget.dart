import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/tracked_event_model.dart';
import '../../utils/dialogs/events_dialogs.dart';
import '../../../../shared/utils/functions.dart';

class TrackedEventWidget extends StatelessWidget {
  const TrackedEventWidget({this.model});

  final TrackedEventModel model;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Dismissible(
        confirmDismiss: (DismissDirection direction) => confirmDismiss(
          direction: direction,
          onUpdateShow: UpdateEventDialogWidget(model: model),
          onRemoveShow: RemoveEventDialogWidget(id: model.id),
        ),
        background: buildBackground(),
        secondaryBackground: buildSecondaryBackground(),
        key: ObjectKey(model),
        child: _buildChild(model),
      ).card.elevation(5).green300.rounded.make();
    });
  }
}

Widget _buildChild(TrackedEventModel model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            model.title.text.size(17).wide.make(),
            SizedBox(height: 5),
            formatDate(model.date).text.size(13.5).gray700.make(),
          ],
        ).px8(),
      ),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(Icons.timer, color: Colors.white).p4(),
          '${model.elapsedTime}${model.unit}'.text.wide.white.size(17).make().pOnly(right: 6),
        ],
      ).card.elevation(5).green800.make(),
    ],
  ).py12();
}
