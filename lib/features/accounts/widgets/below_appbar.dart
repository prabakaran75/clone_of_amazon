import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppbar extends StatelessWidget {
  const BelowAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: "Hello, ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                children: [
                  TextSpan(
                      text: user.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 22,
                      ))
                ]),
          ),
        ],
      ),
    );
  }
}
