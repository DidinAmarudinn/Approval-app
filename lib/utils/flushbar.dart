import 'package:another_flushbar/flushbar.dart';
import 'package:approval_app/style/font_style.dart';
import 'package:approval_app/style/theme.dart';
import 'package:flutter/material.dart';

class CustomFlushbar {
  Future<void> showFlushbar(BuildContext context, String title,
      String message, bool isSuccess) async {
    return await Flushbar(
      title: title,
      margin:const EdgeInsets.all(defaultMargin),
      message: message,
      borderRadius: BorderRadius.circular(12),
      flushbarPosition: FlushbarPosition.BOTTOM,
      backgroundColor: isSuccess ? priamryColor : Colors.red,
      duration: const Duration(seconds: 2),
    ).show(context);
  }
}
