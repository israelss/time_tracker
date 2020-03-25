import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:time_tracker/app/modules/home/home_controller.dart';
import 'package:time_tracker/app/modules/home/home_module.dart';
import 'package:time_tracker/app/shared/models/tracked_event_model.dart';
import 'package:time_tracker/app/shared/utils/functions.dart';
import 'package:time_tracker/app/shared/utils/snackbars.dart';

import 'package:velocity_x/velocity_x.dart';

class AddEventDialogWidget extends StatelessWidget {
  final HomeController controller = HomeModule.to.get<HomeController>();

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TrackedEventModel model = TrackedEventModel(
      date: DateTime.now(),
      elapsedTime: 0,
      id: controller.getEventListLength,
      title: '',
      unit: '',
    );
    return AlertDialog(
          title: Text('Inserir'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Observer(
                builder: (_) {
                  return '${formatDate(model.date)} - ${controller.getElapsedTime}${controller.unit}'
                      .text
                      .size(15)
                      .gray500
                      .make()
                      .click(controller.changeUnit)
                      .make();
                },
              ),
              TextField(
                autofocus: true,
                controller: _textController,
                onChanged: (value) => model.title = value,
                decoration: InputDecoration(
                  suffixIcon: Observer(
                    builder: (_) {
                      ObservableList<String> topicsList = controller.topicsList;
                      return PopupMenuButton(
                        enabled: topicsList.isNotEmpty,
                        onSelected: (selectedValue) {
                          model.title = selectedValue;
                          _textController.text = selectedValue;
                        },
                        icon: Icon(Icons.keyboard_arrow_down),
                        itemBuilder: (_) => List.generate(
                          topicsList.length,
                          (index) => PopupMenuItem(
                            child: Text(topicsList[index] ?? 'ERRO!'),
                            value: topicsList[index] ?? 'ERRO!',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Get.back(result: false),
              child: Text('Cancelar'),
            ),
            Observer(
              builder: (_) {
                return RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: model.title.trim().isNotEmpty
                      ? () async {
                          model.elapsedTime = controller.getElapsedTime;
                          model.unit = controller.unit;
                          controller.addEvent(model);
                          String topicMessage = await controller.addTopic(model.title);
                          showSnackBar(
                              message: 'Tempo adicionado: ${model.title} - ${model.elapsedTime}${controller.unit}$topicMessage', type: BarType.SUCCESS);
                          Get.back(result: true);
                        }
                      : null,
                  child: Text('Salvar'),
                );
              },
            ),
          ],
        ) ??
        false;
  }
}
