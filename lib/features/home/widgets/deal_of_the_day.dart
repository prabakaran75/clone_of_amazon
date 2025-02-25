import 'package:clone_of_amazon/common/widgets/loader.dart';
import 'package:clone_of_amazon/features/home/services/home_service.dart';
import 'package:clone_of_amazon/features/product_details/screens/product_detail_screen.dart';
import 'package:clone_of_amazon/models/product_model.dart';
import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  String img1 =
      "https://st.depositphotos.com/1035350/2277/i/450/depositphotos_22772802-stock-photo-tokyo-cityscape.jpg";
  String img2 =
      "https://st.depositphotos.com/1035350/2277/i/450/depositphotos_22772802-stock-photo-tokyo-cityscape.jpg";
  String img3 =
      "https://st.depositphotos.com/1633205/1861/i/450/depositphotos_18617813-stock-photo-city-of-chicago.jpg";
  String img4 =
      "https://img.freepik.com/free-photo/skyscrapers-distance_1127-194.jpg";
  String img5 =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/City-of-the-future.jpg/1280px-City-of-the-future.jpg";

  ProductModel? product;
  final HomeService homeService = HomeService();

  void fetchDealOfDay() async {
    product = await homeService.fetchDealOfDay(context: context);
    setState(() {});
  }

  @override
  void initState() {
    fetchDealOfDay();
    super.initState();
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? Loader()
        : product!.name.isEmpty
            ? SizedBox()
            : Expanded(
                child: GestureDetector(
                  onTap: () => navigateToDetailScreen(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            "Deal of the day",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                        ),
                        Image.network(
                          product!.images[0],
                          height: 260,
                          fit: BoxFit.fitHeight,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          child: Text(
                            "\$150",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            "New York Trip",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: product!.images
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Image.network(
                                      e,
                                      fit: BoxFit.contain,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          child: Text(
                            "See all deals",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.cyan[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
