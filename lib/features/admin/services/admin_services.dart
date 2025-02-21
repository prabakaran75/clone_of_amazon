import 'dart:convert';
import 'dart:io';
import 'package:clone_of_amazon/constant/error_handling.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/constant/utils.dart';
import 'package:clone_of_amazon/models/product_model.dart';
import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  //Add product
  void sellProdcuts({
    required BuildContext context,
    required String name,
    required String desc,
    required double price,
    required int qty,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic("dalxbugku", "phierei0");
      List<String> imageList = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageList.add(res.secureUrl);
      }
      ProductModel productModel = ProductModel(
        name: name,
        desc: desc,
        qty: qty,
        price: price,
        category: category,
        images: imageList,
      );
      http.Response res = await http.post(
        Uri.parse("$uri/admin/add-product"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": userProvider.user.token,
        },
        body: productModel.toJson(),
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Product added Successfully!");
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get all product
  Future<List<ProductModel>> fetchAllProduct(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ProductModel> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/admin/get-product"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": userProvider.user.token,
        },
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              ProductModel.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  //Delete Product
  void deleteProduct({
    required BuildContext context,
    required ProductModel product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/admin/delete-product"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": userProvider.user.token,
        },
        body: jsonEncode({
          "id": product.id,
        }),
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
