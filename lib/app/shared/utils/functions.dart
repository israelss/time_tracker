import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_tracker/app/shared/utils/remove_event_dialog/remove_event_dialog_widget.dart';
import 'package:time_tracker/app/shared/utils/remove_topic_dialog/remove_topic_dialog_widget.dart';
import 'package:time_tracker/app/shared/utils/update_event_dialog/update_event_dialog_widget.dart';
import 'package:time_tracker/app/shared/utils/update_topic_dialog/update_topic_dialog_widget.dart';
import 'package:velocity_x/velocity_x.dart';

enum Scope { TOPICS, EVENTS }

String formatDate(DateTime dateTime) {
  String day = dateTime.day.toString().padLeft(2, '0');
  String month = dateTime.month.toString().padLeft(2, '0');
  int year = dateTime.year;
  String hour = dateTime.hour.toString().padLeft(2, '0');
  String minute = dateTime.minute.toString().padLeft(2, '0');
  return '$day/$month/$year @ $hour:$minute';
}

Widget buildSecondaryBackground() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[Icon(Icons.delete, color: Colors.white)],
    ),
  ).box.red700.rounded.make();
}

Widget buildBackground() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[Icon(Icons.edit, color: Colors.white)],
    ),
  ).box.color(Colors.amber.shade700).rounded.make();
}

Future<bool> confirmDismiss(DismissDirection direction, model, Scope scope) {
  Future<bool> dialog;
  if (scope == Scope.TOPICS) {
    switch (direction) {
      case DismissDirection.startToEnd:
        dialog = Get.dialog(UpdateTopicDialogWidget(model: model), barrierDismissible: false);
        break;
      case DismissDirection.endToStart:
        dialog = Get.dialog(RemoveTopicDialogWidget(id: model.id), barrierDismissible: false);
        break;
      default:
        dialog = Future.value(false);
        break;
    }
  } else if (scope == Scope.EVENTS) {
    switch (direction) {
      case DismissDirection.startToEnd:
        dialog = Get.dialog(UpdateEventDialogWidget(model: model), barrierDismissible: false);
        break;
      case DismissDirection.endToStart:
        dialog = Get.dialog(RemoveEventDialogWidget(id: model.id), barrierDismissible: false);
        break;
      default:
        dialog = Future.value(false);
        break;
    }
  }
  return dialog;
}

class AnchoredOverlay extends StatelessWidget {
  final bool showOverlay;
  final Widget Function(BuildContext, Offset anchor) overlayBuilder;
  final Widget child;

  AnchoredOverlay({
    this.showOverlay,
    this.overlayBuilder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return new OverlayBuilder(
          showOverlay: showOverlay,
          overlayBuilder: (BuildContext overlayContext) {
            RenderBox box = context.findRenderObject() as RenderBox;
            final center = box.size.center(box.localToGlobal(const Offset(0.0, 0.0)));
            return overlayBuilder(overlayContext, center);
          },
          child: child,
        );
      }),
    );
  }
}

class OverlayBuilder extends StatefulWidget {
  final bool showOverlay;
  final Function(BuildContext) overlayBuilder;
  final Widget child;

  OverlayBuilder({
    this.showOverlay = false,
    this.overlayBuilder,
    this.child,
  });

  @override
  _OverlayBuilderState createState() => new _OverlayBuilderState();
}

class _OverlayBuilderState extends State<OverlayBuilder> {
  OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();

    if (widget.showOverlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
    }
  }

  @override
  void didUpdateWidget(OverlayBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void reassemble() {
    super.reassemble();
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void dispose() {
    if (isShowingOverlay()) {
      hideOverlay();
    }

    super.dispose();
  }

  bool isShowingOverlay() => overlayEntry != null;

  void showOverlay() {
    overlayEntry = new OverlayEntry(
      builder: widget.overlayBuilder,
    );
    addToOverlay(overlayEntry);
  }

  void addToOverlay(OverlayEntry entry) async {
    print('addToOverlay');
    Overlay.of(context).insert(entry);
  }

  void hideOverlay() {
    print('hideOverlay');
    overlayEntry.remove();
    overlayEntry = null;
  }

  void syncWidgetAndOverlay() {
    if (isShowingOverlay() && !widget.showOverlay) {
      hideOverlay();
    } else if (!isShowingOverlay() && widget.showOverlay) {
      showOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class CenterAbout extends StatelessWidget {
  final Offset position;
  final Widget child;

  CenterAbout({
    this.position,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: position.dy,
      left: position.dx,
      child: new FractionalTranslation(
        translation: const Offset(-0.5, -0.5),
        child: child,
      ),
    );
  }
}
