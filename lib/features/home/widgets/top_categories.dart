import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/home/screens/category_deal_screen.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          var categoryImage = GlobalVariables.categoryImages[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CategoryDealScreen.routeName);
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      height: 40,
                      width: 40,
                      categoryImage['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  categoryImage['title']!,
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
