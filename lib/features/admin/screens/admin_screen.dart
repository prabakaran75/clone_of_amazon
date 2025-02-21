import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomSheetWidth = 42;
  double bottomBorderWidth = 5;
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    PostScreen(),
    Center(
      child: Text("Account Page"),
    ),
    Center(
      child: Text("Cart Page"),
    ),
  ];
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
                  width: 100,
                  height: 40,
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                // padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                child: Text(
                  "Admin",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 18,
        onTap: updatePage,
        items: [
          //Home
          BottomNavigationBarItem(
              icon: Container(
                width: bottomSheetWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBorderWidth,
                    ),
                  ),
                ),
                child: Icon(Icons.home_outlined),
              ),
              label: ''),
          //Person
          BottomNavigationBarItem(
              icon: Container(
                width: bottomSheetWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBorderWidth,
                    ),
                  ),
                ),
                child: Icon(Icons.person_2_outlined),
              ),
              label: ''),
          //Cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomSheetWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBorderWidth,
                  ),
                ),
              ),
              child: Icon(Icons.location_city),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
