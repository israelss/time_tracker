import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:time_tracker/app/modules/home/home_controller.dart';
import 'package:time_tracker/app/modules/home/home_module.dart';
import 'package:time_tracker/app/shared/models/tracked_event_model.dart';
import 'package:time_tracker/app/shared/utils/snackbars.dart';
import 'package:velocity_x/velocity_x.dart';

class UpdateEventDialogWidget extends StatelessWidget {
  final TrackedEventModel model;
  final HomeController controller = HomeModule.to.get<HomeController>();

  UpdateEventDialogWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _oldTitle = model.title;
    TextEditingController _textController = TextEditingController(text: model.title);
    return AlertDialog(
      title: Text('Editar'),
      content: TextField(
        controller: _textController,
        autofocus: true,
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
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            model.title = _oldTitle;
            Get.back(result: false);
          },
          child: Text('Cancelar'),
        ),
        Observer(
          builder: (_) {
            return RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: model.title.isNotBlank
                  ? () async {
                      await controller.update(model).then(
                            (updatedModel) => showSnackBar(
                              message: 'Tópico atualizado:\n\nDe: $_oldTitle\n\nPara: ${updatedModel.title}',
                              type: BarType.SUCCESS,
                            ),
                          );
                      Get.back(result: false);
                    }
                  : null,
              child: Text('Salvar'),
            );
          },
        ),
      ],
    );
  }
}
