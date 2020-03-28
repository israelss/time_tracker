import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import 'components/topic/topic_widget.dart';
import 'topics_controller.dart';
import 'topics_module.dart';
import 'utils/dialogs/add_topic_dialog_widget.dart';

TopicsController controller = TopicsModule.to.get<TopicsController>();

class TopicsPage extends StatelessWidget {
  TopicsPage({Key key, this.title = "Editar tópicos"});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        automaticallyImplyLeading: false,
        leading: _buildTopicsPageLeading(),
        actions: <Widget>[FlatButton(child: Icon(Icons.close, color: Colors.white), onPressed: () => Get.back())],
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
        child: Icon(Icons.add),
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
      child: Text('Não'),
    ),
    confirm: FlatButton(
        onPressed: () {
          controller.removeAll();
          Get.back();
        },
        child: Text('Sim')),
    content: Text('Deseja realmente excluir todos os tópicos?'),
    title: 'Confirmar',
  );
}
