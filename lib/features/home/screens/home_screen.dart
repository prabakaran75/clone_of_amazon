import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/home/widgets/address_box.dart';
import 'package:clone_of_amazon/features/home/widgets/carousal_images.dart';
import 'package:clone_of_amazon/features/home/widgets/deal_of_the_day.dart';
import 'package:clone_of_amazon/features/home/widgets/top_categories.dart';
// import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 10),
                  child: Material(
                    color: Colors.white,
                    elevation: 1,
                    borderRadius: BorderRadius.circular(5),
                    child: TextFormField(
                      cursorColor: Colors.black38,
                      decoration: InputDecoration(
                        hintText: "Search Amazon.in",
                        hintStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        prefixIcon: InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(top: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.mic),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          AddressBox(),
          SizedBox(
            height: 10,
          ),
          TopCategories(),
          SizedBox(
            height: 10,
          ),
          CarousalImages(),
          DealOfTheDay(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
