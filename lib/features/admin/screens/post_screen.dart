import 'package:clone_of_amazon/common/widgets/loader.dart';
import 'package:clone_of_amazon/features/accounts/widgets/single_product.dart';
import 'package:clone_of_amazon/features/admin/screens/add_product_screen.dart';
import 'package:clone_of_amazon/features/admin/services/admin_services.dart';
import 'package:clone_of_amazon/models/product_model.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final AdminServices adminServices = AdminServices();
  List<ProductModel>? productList;

  void fetchAllProduct() async {
    productList = await adminServices.fetchAllProduct(context);
    setState(() {});
  }

  void deleteProduct(
    ProductModel product,
    int index,
  ) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        productList!.removeAt(index);
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    fetchAllProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? Loader()
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                itemCount: productList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final product = productList![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: SingleProduct(
                          image: product.images[0],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            IconButton(
                              onPressed: () => deleteProduct(product, index),
                              icon: Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, AddProductScreen.routeName);
              },
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
