import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { ERROR, SUCCESS, WARNING }
void showToast({required String message, required ToastType type}) {
  String? color;
  Color? textColor = Colors.white;
  if (type == ToastType.SUCCESS) {
    color = 'green';
  } else if (type == ToastType.WARNING) {
    color = 'yellow';
    textColor = Colors.black;
  }
  if (type == ToastType.ERROR) {
    color = 'red';
  }
  Fluttertoast.showToast(
      msg: message,
      textColor: textColor,
      webBgColor: color,
      webPosition: 'center',
      webShowClose: true,
      timeInSecForIosWeb: 30,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_LONG);
}