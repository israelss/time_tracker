import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../topics_module.dart';
import '../../topics_controller.dart';
import '../../../../modules/topics/models/topic_model.dart';
import '../../../../shared/utils/snackbars.dart';

class UpdateTopicDialogWidget extends StatelessWidget {
  UpdateTopicDialogWidget({Key key, this.model}) : super(key: key);

  final TopicsController controller = TopicsModule.to.get<TopicsController>();
  final TopicModel model;

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
          builder: (_) => RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: model.title.isNotBlank
                ? () async {
                    await controller.update(model, _oldTitle).then(
                          (either) => either.fold(
                            (failure) => showSnackBar(
                              message: failure.message,
                              type: BarType.FAILURE,
                            ),
                            (model) => showSnackBar(
                              message: 'Tópico atualizado:\n\nDe: $_oldTitle\n\nPara: ${model.title}',
                              type: BarType.SUCCESS,
                            ),
                          ),
                        );
                    Get.back(result: false);
                  }
                : null,
            child: Text('Salvar'),
          ),
        ),
      ],
    );
  }
}
