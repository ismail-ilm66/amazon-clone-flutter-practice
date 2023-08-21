import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final Color? borderColor;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter Your $hintText";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        label: Text(hintText),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor == null ? Colors.black26 : borderColor!,
          ),
        ),
      ),
    );
  }
}
