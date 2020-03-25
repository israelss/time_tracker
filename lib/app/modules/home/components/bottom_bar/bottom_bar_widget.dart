import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:time_tracker/app/app_widget.dart';
import 'package:time_tracker/app/modules/home/home_controller.dart';
import 'package:time_tracker/app/modules/home/home_module.dart';
import 'package:time_tracker/app/shared/utils/add_event_dialog/add_event_dialog_widget.dart';

final HomeController controller = HomeModule.to.get<HomeController>();

bool shouldHideResetFab = false;

class BottomBarWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  // todo hide the reset FAB when adding an event
  _showAddEventDialog() async {
    shouldHideResetFab = true;
    controller.stopTimer();
    bool _shouldResetTimer = await Get.dialog(AddEventDialogWidget(), barrierDismissible: false);
    if (_shouldResetTimer ?? false) return controller.resetTimer();
    // todo show the reset FAB again if we did not add a new event
    shouldHideResetFab = false;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: Observer(
        builder: (_) {
          return ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonMinWidth: MediaQuery.of(context).size.width * 0.29,
            mainAxisSize: MainAxisSize.max,
            buttonPadding: EdgeInsets.all(5),
            children: <Widget>[
              FlatButton.icon(
                textColor: Colors.white,
                color: Colors.green,
                onPressed: controller.hasElapsedTime ? _showAddEventDialog : null,
                icon: Icon(Icons.add_box),
                label: Text('Salvar'),
              ),
              FlatButton(
                onPressed: controller.changeUnit,
                child: Text(
                  '${controller.getElapsedTime}${controller.unit}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              FlatButton(
                child: SizedBox(width: 0, height: 0),
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}

// HACK
// HACK
// HACK START FAB STARTS HERE
// HACK
// HACK
class StartFAB extends StatefulWidget {
  @override
  _StartFABState createState() => _StartFABState();
}

class _StartFABState extends State<StartFAB> with SingleTickerProviderStateMixin, RouteAware {
  AnimationController _controller;
  Animation<double> _curve;
  ReactionDisposer _fabDispose;
  Animation<Offset> _offsetFloat;
  Animation<double> _opacity;
  OverlayEntry _overlayEntry;
  GlobalKey _startFabKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _controller.forward();
  }

  @override
  void didPushNext() {
    super.didPushNext();
    _controller.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _fabDispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 240));

    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _offsetFloat = Tween<Offset>(begin: Offset(0.0, 0.3), end: Offset.zero).animate(_curve);
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_curve);

    _fabDispose = reaction(
      // What we are reacting to...a.k.a. our listenable
      (_) => controller.timerIsRunning,
      // What we'll do when our listenable changes
      (timerIsRunning) {
        if (timerIsRunning) {
          _controller.reverse();
          if (_overlayEntry != null) {
            _overlayEntry.remove();
            _overlayEntry = null;
          }
        } else if (!timerIsRunning && !shouldHideResetFab) {
          _controller.forward();
          if (_controller.isDismissed) {
            _overlayEntry.remove();
            _overlayEntry = null;
          }
          if (_overlayEntry == null) {
            _overlayEntry = _createOverlayEntry();
            // todo find a way to insert just above the main overlay and not above all things!
            // ? Maybe use another context??
            Overlay.of(context).insert(_overlayEntry);
          }
        }
      },
    );
  }

  void _pauseStartPressed() => controller.timerIsRunning ? controller.stopTimer() : controller.startTimer();

  OverlayEntry _createOverlayEntry() {
    final RenderBox fabRenderBox = _startFabKey.currentContext.findRenderObject();
    final fabSize = fabRenderBox.size;
    final fabPosition = fabRenderBox.localToGlobal(Offset.zero);
    return OverlayEntry(builder: (_) {
      return Positioned(
        top: fabPosition.dy - fabSize.height - kFloatingActionButtonMargin / 2,
        right: kFloatingActionButtonMargin,
        child: FadeTransition(
          opacity: _opacity,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) => SlideTransition(position: _offsetFloat, child: child),
            child: FloatingActionButton(
              elevation: 2,
              onPressed: () => _controller.isCompleted
                  ? (() {
                      _controller.reverse();
                      controller.resetTimer();
                    })()
                  : null,
              child: Icon(Icons.restore),
              backgroundColor: Colors.redAccent,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return FloatingActionButton(
        key: _startFabKey,
        onPressed: _pauseStartPressed,
        child: Icon(controller.timerIsRunning ? Icons.pause : Icons.play_arrow),
        backgroundColor: controller.timerIsRunning ? Colors.orange : Colors.green,
      );
    });
  }
}
