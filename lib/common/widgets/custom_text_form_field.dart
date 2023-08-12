import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter Your $hintText";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        label: Text(hintText),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
      ),
    );
  }
}
