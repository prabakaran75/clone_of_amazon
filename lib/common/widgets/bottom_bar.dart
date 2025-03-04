import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/accounts/screens/account_screen.dart';
import 'package:clone_of_amazon/features/cart/screens/cart_screen.dart';
import 'package:clone_of_amazon/features/home/screens/home_screen.dart';
import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomSheetWidth = 42;
  double bottomBorderWidth = 5;
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    HomeScreen(),
    AccountScreen(),
    CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final userCartLength = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
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
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -15, end: -2),
                badgeContent: Text(userCartLength.toString()),
                badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                child: Icon(Icons.shopping_cart),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
