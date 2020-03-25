import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_tracker/app/modules/topics/topics_controller.dart';
import 'package:time_tracker/app/modules/topics/topics_module.dart';
import 'package:time_tracker/app/shared/utils/snackbars.dart';

class RemoveTopicDialogWidget extends StatelessWidget {
  RemoveTopicDialogWidget({Key key, this.id}) : super(key: key);

  final TopicsController controller = TopicsModule.to.get<TopicsController>();
  final int id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja mesmo remover?'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            controller.remove(id);
            showSnackBar(message: 'Removido', type: BarType.SUCCESS);
            Get.back(result: true);
          },
          child: Text('Apagar'),
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () => Get.back(result: false),
          child: Text('Cancelar'),
        ),
      ],
    );
  }
}
