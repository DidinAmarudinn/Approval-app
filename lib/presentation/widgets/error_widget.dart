import 'package:approval_app/presentation/widgets/button_widget.dart';
import 'package:approval_app/style/font_style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
  final double width;
  const CustomErrorWidget(
      {Key? key,
      required this.errorMessage,
      required this.onPressed,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          errorMessage,
          style: primaryTextStyle.copyWith(fontWeight: semiBold),
        ),
        const SizedBox(
          height: defaultMargin,
        ),
        ButtonWidget(
          buttonName: "Rety",
          onPressed: onPressed,
          height: 45,
          width: width,
        ),
      ],
    );
  }
}
