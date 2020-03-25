import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:time_tracker/app/modules/topics/components/topics_list/topics_list_widget.dart';
import 'package:time_tracker/app/modules/topics/topics_controller.dart';
import 'package:time_tracker/app/modules/topics/topics_module.dart';
import 'package:time_tracker/app/shared/utils/add_topic_dialog/add_topic_dialog_widget.dart';

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
        leading: _buildLeading(),
        actions: <Widget>[FlatButton(child: Icon(Icons.close, color: Colors.white), onPressed: () => Get.back())],
      ),
      body: TopicsListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(AddTopicDialogWidget(), barrierDismissible: false),
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget _buildLeading() {
  return Observer(builder: (_) {
    bool _enabled = controller.list.length > 0;
    return FlatButton(
      child: Icon(
        Icons.delete_sweep,
        color: _enabled ? Colors.white : Colors.grey[850],
      ),
      onPressed: _enabled ? _removeAll : null,
    );
  });
}

void _removeAll() async {
  await Get.defaultDialog(
    cancel: RaisedButton(
      child: Text('Não'),
      onPressed: () => Get.back(),
      color: Colors.deepPurple,
    ),
    confirm: FlatButton(
        child: Text('Sim'),
        onPressed: () {
          controller.removeAll();
          Get.back();
        }),
    title: 'Confirmar',
    content: Text('Deseja realmente excluir todos os tópicos?'),
  );
}
