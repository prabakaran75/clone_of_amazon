import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone_of_amazon/common/widgets/custom_button.dart';
import 'package:clone_of_amazon/common/widgets/custom_textformfield.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/constant/utils.dart';
import 'package:clone_of_amazon/features/admin/services/admin_services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/addProduct';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final productCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final qtyCtrl = TextEditingController();
  final AdminServices adminServices = AdminServices();

  @override
  void dispose() {
    productCtrl.dispose();
    descCtrl.dispose();
    priceCtrl.dispose();
    qtyCtrl.dispose();
    super.dispose();
  }

  final _addProductFormKey = GlobalKey<FormState>();

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProdcuts(
        context: context,
        name: productCtrl.text,
        desc: descCtrl.text,
        price: double.parse(priceCtrl.text),
        qty: int.parse(qtyCtrl.text),
        category: category,
        images: images,
      );
    }
  }

  List<File> images = [];

  void selectedImage() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  String category = "Mobiles";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            "Add Product",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((e) {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              e,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 150,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectedImage,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          dashPattern: [10, 4],
                          strokeCap: StrokeCap.round,
                          child: SizedBox(
                            height: 130,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_outlined,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Select Product Image",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        const Color.fromARGB(137, 36, 35, 35),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                CustomTextformfield(
                  controller: productCtrl,
                  hintText: "Product Name",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextformfield(
                  maxLines: 3,
                  controller: descCtrl,
                  hintText: "Description",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextformfield(
                  controller: priceCtrl,
                  hintText: "Price",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextformfield(
                  controller: qtyCtrl,
                  hintText: "Quantity",
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    borderRadius: BorderRadius.circular(5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      border: InputBorder.none,
                    ),
                    dropdownColor: Colors.white,
                    value: category,
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        category = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: "Sell",
                  onTap: sellProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
