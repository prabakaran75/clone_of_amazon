import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 180,
        width: 180,
        child: Image.network(
          image,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
