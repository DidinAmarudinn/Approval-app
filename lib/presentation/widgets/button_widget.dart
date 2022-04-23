import 'package:approval_app/style/theme.dart';
import 'package:flutter/material.dart';

import '../../style/font_style.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Function onPressed;
  final double height;
  final double width;
  final bool? isSecondary;
  final bool? isSmall;
  const ButtonWidget(
      {Key? key,
      required this.buttonName,
      required this.onPressed,
      required this.height,
      required this.width,
      this.isSecondary = false, this.isSmall = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: TextButton.styleFrom(
          backgroundColor:  priamryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: primaryTextStyle.copyWith(
                fontSize: isSmall! ? 12: 16,
                fontWeight: medium,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}