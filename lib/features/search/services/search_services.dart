import 'dart:convert';
import 'package:amazon_clone/constants/utils..dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/errorHandle.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchServices {
  Future<List<Product>> getSearchedProducts(
    BuildContext context,
    String query,
  ) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    List<Product> products = [];
    try {
      final res = await http.get(
        Uri.parse("$uri/api/products/search/$query"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': user.token,
        },
      );
      print(res.body);

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              products.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
    return products;
  }
}
