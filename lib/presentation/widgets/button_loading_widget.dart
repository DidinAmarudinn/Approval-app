import 'package:approval_app/style/theme.dart';
import 'package:flutter/material.dart';

import '../../style/font_style.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: priamryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:const EdgeInsets.only(right: 4),
              height: 16,
              width: 16,
              child:const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
            Text(
              "Loading",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: medium, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}