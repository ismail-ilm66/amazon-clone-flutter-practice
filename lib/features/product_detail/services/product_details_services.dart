import 'dart:convert';

import 'package:amazon_clone/constants/errorHandle.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils..dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailsServices {
  void rateProduct(
      {required BuildContext context,
      required Product product,
      required double rating}) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final res = await http.post(
        Uri.parse('$uri/api/add-product-rating'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': user.token,
        },
        body: jsonEncode(
          {'id': product.id, 'rating': rating},
        ),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(response: res, context: context, onSuccess: () {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': user.token,
        },
        body: jsonEncode(
          {'id': product.id},
        ),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            User u = user.copywith(cart: jsonDecode(res.body)['cart']);
            Provider.of<UserProvider>(context, listen: false).updateUser(u);
            showSnackBar(context, 'Product Added To Cart');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void deleteFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final res = await http.delete(
        Uri.parse('$uri/api/delete-from-cart/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': user.token,
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            User u = user.copywith(cart: jsonDecode(res.body)['cart']);
            Provider.of<UserProvider>(context, listen: false).updateUser(u);
            showSnackBar(context, 'Product Deleted From Cart');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
