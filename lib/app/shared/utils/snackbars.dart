import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BarType { SUCCESS, FAILURE }

void showSnackBar({String message, BarType type}) {
  switch (type) {
    case BarType.SUCCESS:
      return Get.snackbar(
        'SUCESSO',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.7),
        icon: Icon(Icons.check_circle_outline),
        shouldIconPulse: false,
        onTap: (snack) => snack.dismiss(),
        animationDuration: Duration(milliseconds: 300),
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
      );
      break;
    case BarType.FAILURE:
      return Get.snackbar(
        'FALHA',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
        icon: Icon(Icons.error_outline, color: Colors.white),
        shouldIconPulse: false,
        onTap: (snack) => snack.dismiss(),
        animationDuration: Duration(milliseconds: 300),
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
      );
      break;
    default:
  }
}
