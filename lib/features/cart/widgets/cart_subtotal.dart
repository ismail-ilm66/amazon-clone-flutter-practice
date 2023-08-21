import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartSubtotal extends StatelessWidget {
  CartSubtotal({super.key});
  var cartItems = [];

  double subtotal = 0.0;
  @override
  Widget build(BuildContext context) {
    cartItems = Provider.of<UserProvider>(context, listen: false).user.cart;

    for (int i = 0; i < cartItems.length; i++) {
      subtotal += double.parse(cartItems[i]['product']['price'].toString()) *
          double.parse(cartItems[0]['quantity'].toString());
    }

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        children: [
          Text(
            'Subtotal ',
            style: TextStyle(fontSize: 22),
          ),
          Text(
            '\$${subtotal.toString()}',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
