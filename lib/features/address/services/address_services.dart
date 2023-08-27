import 'dart:convert';

import 'package:amazon_clone/constants/errorHandle.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils..dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddressServices {
  void saveAddress(
      {required BuildContext context, required String address}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    print(address);
    try {
      final res = await http.post(
        Uri.parse('$uri/api/add-user-address'),
        body: jsonEncode(
          {'address': address},
        ),
        headers: <String, String>{
          'x-auth-token': userProvider.user.token,
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          User u = userProvider.user
              .copywith(address: jsonDecode(res.body)['address']);
          userProvider.updateUser(u);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void placeOrder({
    required BuildContext context,
    required String address,
    required double totalPrice,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    print(address);
    print(totalPrice);
    try {
      final res = await http.post(
        Uri.parse('$uri/api/order'),
        body: jsonEncode(
          {
            'cart': userProvider.user.cart,
            'totalPrice': totalPrice,
            'address': address
          },
        ),
        headers: <String, String>{
          'x-auth-token': userProvider.user.token,
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          print(res.body);
          showSnackBar(context, 'The Order Has Been Placed Successfully!!');
          User u = userProvider.user.copywith(cart: []);
          userProvider.updateUser(u);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
