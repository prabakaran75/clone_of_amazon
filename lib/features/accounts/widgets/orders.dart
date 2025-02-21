import 'package:clone_of_amazon/features/accounts/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<String> imageList = [
    "https://electronicparadise.in/cdn/shop/files/4_65e28377-a245-4b2d-b59a-9a4d1d88d331.jpg?v=1731587298&width=1200",
    "https://4.imimg.com/data4/SJ/BA/MY-3018414/apple-laptop-500x500.jpg",
    "https://p4-ofp.static.pub//fes/cms/2024/05/20/bck35fhess1td0jtxhbqx1a2s9ofzk318843.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "Your orders",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
        //Display product
        SizedBox(
          height: 180,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return SingleProduct(image: imageList[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
