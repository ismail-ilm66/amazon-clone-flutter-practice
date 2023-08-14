import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black12.withOpacity(0.03),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            primary: Color.fromARGB(244, 244, 244, 255),

            // backgroundColor: Colors.white,
            //foregroundColor: Colors.white,
            //disabledBackgroundColor: Colors.white,
            //disabledForegroundColor: Colors.white,
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
