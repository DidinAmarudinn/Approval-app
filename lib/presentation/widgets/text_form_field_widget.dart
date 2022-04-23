import 'package:approval_app/style/font_style.dart';
import 'package:approval_app/style/theme.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String validationErrorText;
  final String placholder;
  const TextFormFieldWidget(
      {Key? key,
      required this.label,
      required this.controller,
      required this.validationErrorText,
      required this.placholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: primaryTextStyle.copyWith(fontWeight: semiBold,fontSize: 16),
        ),
        const SizedBox(
          height: defaultMargin / 2,
        ),
        SizedBox(
          child: TextFormField(
            controller: controller,
            style: primaryTextStyle,
            
            validator: (String? value) {
              if (value != null) {
                return null;

              }
              return validationErrorText;
              
            },
            decoration: InputDecoration(
                hintText: placholder,
                labelStyle: primaryTextStyle,
                hintStyle: primaryTextStyle.copyWith(fontWeight: light),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide:const BorderSide(width:1, color: priamryColor))
            )
          ),
        )
      ],
    );
  }
}
