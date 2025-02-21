import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/accounts/widgets/below_appbar.dart';
import 'package:clone_of_amazon/features/accounts/widgets/orders.dart';
import 'package:clone_of_amazon/features/accounts/widgets/top_bottons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/amazon_in.png",
                  width: 120,
                  height: 40,
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 18,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          BelowAppbar(),
          SizedBox(
            height: 10,
          ),
          TopBottons(),
          SizedBox(
            height: 10,
          ),
          Orders(),
        ],
      ),
    );
  }
}
