import 'package:flutter/material.dart';

class LoadingBarWidget extends StatelessWidget {
  const LoadingBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.cyan[300],
      ),
    );
  }
}
