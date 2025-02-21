import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:flutter/material.dart';

class CarousalImages extends StatelessWidget {
  const CarousalImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((e) {
        return Builder(
          builder: (BuildContext context) => Image.network(
            e,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 150,
      ),
    );
  }
}
