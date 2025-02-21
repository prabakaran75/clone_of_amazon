import 'dart:convert';
import 'package:clone_of_amazon/common/widgets/bottom_bar.dart';
import 'package:clone_of_amazon/constant/error_handling.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/constant/utils.dart';
import 'package:clone_of_amazon/models/user_model.dart';
import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserModel userModel = UserModel(
          id: "",
          name: name,
          email: email,
          password: password,
          address: "",
          type: "",
          token: "");

      http.Response res = await http.post(
        Uri.parse("$uri/api/signup"),
        body: userModel.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context,
              "Account has been created! Please Login with the same credentials!");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //Signin User
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserModel userModel = UserModel(
          id: '',
          name: '',
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');
      http.Response res = await http.post(
        Uri.parse("$uri/api/signin"),
        body: userModel.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      print(res.body);
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () async {
          final prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get user data
  void getData(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");
      print("Retrieved token: $token");
      if (token == null || token.isEmpty) {
        prefs.setString("x-auth-token", "");
        print("Token is empty, returning.");
        return;
      }
      var tokenRes = await http.post(
        Uri.parse("$uri/tokenIsValid"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": token,
        },
      );
      print("Token verification response: ${tokenRes.body}");
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        final userRes = await http.get(
          Uri.parse("$uri/"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "x-auth-token": token,
          },
        );
        print("User data response: ${userRes.body}");
        if (userRes.statusCode == 200) {
          var userProvider = Provider.of<UserProvider>(context, listen: false);
          userProvider.setUser(userRes.body);
        }
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
