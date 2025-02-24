import 'dart:convert';

import 'package:clone_of_amazon/constant/error_handling.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/constant/utils.dart';
import 'package:clone_of_amazon/models/product_model.dart';
import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailService {
  void rateProduct({
    required BuildContext context,
    required ProductModel product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/rate-product"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": userProvider.user.token,
        },
        body: jsonEncode({
          "id": product.id,
          "rating": rating,
        }),
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
