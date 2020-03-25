import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_tracker/app/modules/home/home_controller.dart';
import 'package:time_tracker/app/modules/home/home_module.dart';
import 'package:time_tracker/app/shared/utils/snackbars.dart';

class RemoveEventDialogWidget extends StatelessWidget {
  RemoveEventDialogWidget({Key key, this.id}) : super(key: key);

  final HomeController controller = HomeModule.to.get<HomeController>();
  final int id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja apagar esta entrada?'),
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
