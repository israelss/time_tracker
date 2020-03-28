import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

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

Future<bool> confirmDismiss({DismissDirection direction, onUpdateShow, onRemoveShow}) {
  Future<bool> dialog;
  switch (direction) {
    case DismissDirection.startToEnd:
      dialog = Get.dialog(onUpdateShow, barrierDismissible: false);
      break;
    case DismissDirection.endToStart:
      dialog = Get.dialog(onRemoveShow, barrierDismissible: false);
      break;
    default:
      dialog = Future.value(false);
      break;
  }
  return dialog;
}
