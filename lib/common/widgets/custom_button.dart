import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final String label;
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: GlobalVariables.backgroundColor,
        backgroundColor: buttonColor ?? GlobalVariables.secondaryColor,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }
}
