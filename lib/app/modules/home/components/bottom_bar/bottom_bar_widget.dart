import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../../home_controller.dart';
import '../../home_module.dart';
import '../../../home/utils/dialogs/add_event_dialog_widget.dart';

final HomeController controller = HomeModule.to.get<HomeController>();

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key key}) : super(key: key);

  void _pauseStartPressed() => controller.timerIsRunning ? controller.stopTimer() : controller.startTimer();

  void _showAddEventDialog() async {
    controller.stopTimer();
    bool _shouldResetTimer = await Get.dialog(AddEventDialogWidget(), barrierDismissible: false);
    if (_shouldResetTimer ?? false) controller.resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.29;
    final buttonHeight = kBottomNavigationBarHeight - ButtonTheme.of(context).height;
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Observer(
        builder: (_) {
          return ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            buttonMinWidth: buttonWidth,
            buttonPadding: EdgeInsets.all(5),
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton.icon(
                color: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                textColor: Colors.white,
                onPressed: controller.hasElapsedTime ? _showAddEventDialog : null,
                icon: Icon(Icons.add_box),
                label: Text('Salvar'),
              ),
              FlatButton(
                color: Colors.deepPurpleAccent.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(width: 1, color: Colors.deepPurple.shade900),
                ),
                splashColor: Colors.green,
                onPressed: controller.changeUnit,
                child: SizedBox(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${controller.getElapsedTime}${controller.unit}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  height: buttonHeight,
                  width: buttonWidth,
                ),
              ),
              FlatButton.icon(
                color: controller.timerIsRunning ? Colors.green.shade900 : Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                splashColor: Colors.transparent,
                textColor: Colors.white,
                onPressed: _pauseStartPressed,
                icon: Icon(controller.timerIsRunning ? Icons.pause : Icons.play_arrow),
                label: Text(controller.timerIsRunning ? 'Pausar' : 'Iniciar'),
              ),
            ],
          );
        },
      ),
    );
  }
}
