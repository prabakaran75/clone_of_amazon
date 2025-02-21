import 'package:clone_of_amazon/features/accounts/widgets/account_buttons.dart';
import 'package:flutter/material.dart';

class TopBottons extends StatefulWidget {
  const TopBottons({super.key});

  @override
  State<TopBottons> createState() => _TopBottonsState();
}

class _TopBottonsState extends State<TopBottons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: AccountButtons(text: "Your Orders", onPresssed: () {})),
            Expanded(
                child: AccountButtons(text: "True Seller", onPresssed: () {})),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: AccountButtons(text: "Log Out", onPresssed: () {})),
            Expanded(
                child:
                    AccountButtons(text: "Your WishList", onPresssed: () {})),
          ],
        ),
      ],
    );
  }
}
