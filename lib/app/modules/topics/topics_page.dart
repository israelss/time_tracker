import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import 'components/topic/topic_widget.dart';
import 'topics_controller.dart';
import 'topics_module.dart';
import 'utils/dialogs/add_topic_dialog_widget.dart';

TopicsController controller = TopicsModule.to.get<TopicsController>();

class TopicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Editar tópicos'),
        automaticallyImplyLeading: false,
        leading: _buildTopicsPageLeading(),
        actions: <Widget>[
          FlatButton(
            child: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (_, index) => TopicWidget(model: controller.list[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(AddTopicDialogWidget(), barrierDismissible: false),
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _buildTopicsPageLeading() {
  return Observer(builder: (_) {
    bool _enabled = controller.list.length > 0;
    return FlatButton(
      child: Icon(
        Icons.delete_sweep,
        color: _enabled ? Colors.white : Colors.grey[850],
      ),
      onPressed: _enabled ? _removeAllTopics : null,
    );
  });
}

void _removeAllTopics() async {
  await Get.defaultDialog(
    cancel: RaisedButton(
      color: Colors.deepPurple,
      onPressed: () => Get.back(),
      child: const Text('Não'),
    ),
    confirm: FlatButton(
        onPressed: () {
          controller.removeAll();
          Get.back();
        },
        child: const Text('Sim')),
    content: const Text('Deseja realmente excluir todos os tópicos?'),
    title: 'Confirmar',
  );
}
