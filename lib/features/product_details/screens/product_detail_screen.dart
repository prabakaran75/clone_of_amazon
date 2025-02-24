import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone_of_amazon/common/widgets/custom_button.dart';
import 'package:clone_of_amazon/common/widgets/stars.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/search/screens/search_screen.dart';
import 'package:clone_of_amazon/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
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
                child: SizedBox(
                  height: 40,
                  child: Material(
                    color: Colors.white,
                    elevation: 1,
                    borderRadius: BorderRadius.circular(5),
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  Stars(ratings: 4),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Text(
                widget.product.name,
                style: TextStyle(fontSize: 14),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map((e) {
                return Builder(
                  builder: (BuildContext context) => Image.network(
                    e,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 200,
              ),
            ),
            Container(
              color: Colors.black12,
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                text: TextSpan(
                    text: "Deal Price: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "\$${widget.product.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 18,
                        ),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Text(widget.product.desc),
            ),
            Container(
              color: Colors.black12,
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: "Buy now",
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: "Add to cart",
                onTap: () {},
                color: Colors.yellowAccent,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.black12,
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Rating",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              allowHalfRating: true,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 3),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: GlobalVariables.secondaryColor,
              ),
              onRatingUpdate: (onRating) {},
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
