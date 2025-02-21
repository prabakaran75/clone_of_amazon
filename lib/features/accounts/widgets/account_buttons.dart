import 'package:flutter/material.dart';

class AccountButtons extends StatelessWidget {
  final String text;
  final VoidCallback onPresssed;
  const AccountButtons(
      {super.key, required this.text, required this.onPresssed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.0),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: const Color.fromARGB(137, 41, 41, 41)),
            elevation: 2,
            backgroundColor: const Color.fromARGB(31, 139, 135, 135)),
        onPressed: onPresssed,
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 13),
        ),
      ),
    );
  }
}
