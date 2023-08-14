import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdressBar extends StatelessWidget {
  const AdressBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 114, 226, 221),
              Color.fromARGB(255, 162, 236, 233),
            ],
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.location_on_outlined),
            Text('Delivery to ${user.name} - ${user.address}'),
          ],
        ));
  }
}
