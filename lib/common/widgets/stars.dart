import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final double ratings;
  const Stars({super.key, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      rating: ratings,
      itemCount: 5,
      itemSize: 12,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: GlobalVariables.secondaryColor,
      ),
    );
  }
}
