import 'package:clone_of_amazon/common/widgets/stars.dart';
import 'package:clone_of_amazon/models/product_model.dart';
import 'package:flutter/material.dart';

class SearchedProducts extends StatelessWidget {
  final ProductModel product;
  const SearchedProducts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 110,
                width: 110,
              ),
              Column(
                children: [
                  Container(
                    width: 180,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 180,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Stars(ratings: avgRating),
                  ),
                  Container(
                    width: 180,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "\$${product.price}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 180,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "Eligible for FREE Shipping",
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 180,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "In Stock",
                      style: TextStyle(color: Colors.teal),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
