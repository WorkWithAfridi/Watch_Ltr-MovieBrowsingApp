import 'package:flutter/material.dart';

import '../../constants/customColors.dart';
import '../../constants/customTextStyle.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(

      style: defaultTS,
      cursorColor: red,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: defaultTS.copyWith(color: white.withOpacity(.5)),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        fillColor: black.withOpacity(.9),
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
