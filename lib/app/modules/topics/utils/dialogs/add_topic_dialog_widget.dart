import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../../topics_controller.dart';
import '../../topics_module.dart';
import '../../../../modules/topics/models/topic_model.dart';
import '../../../../shared/utils/snackbars.dart';

class AddTopicDialogWidget extends StatelessWidget {
  final TopicsController controller = TopicsModule.to.get<TopicsController>();
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TopicModel model = TopicModel(id: null, title: '');

    return AlertDialog(
      title: Text('Inserir tópico'),
      content: TextField(
        autofocus: true,
        controller: _textController,
        onChanged: (value) => model.title = value,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Get.back(result: false),
          child: Text('Cancelar'),
        ),
        Observer(builder: (_) {
          return RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: model.title.trim().isNotEmpty
                ? () async {
                    await controller.add(model).then((either) => either?.fold(
                          (failure) => showSnackBar(message: failure.message, type: BarType.FAILURE),
                          (model) => showSnackBar(message: 'Tópico adicionado: ${model.title}', type: BarType.SUCCESS),
                        ));
                    Get.back(result: false);
                  }
                : null,
            child: Text('Salvar'),
          );
        }),
      ],
    );
  }
}
