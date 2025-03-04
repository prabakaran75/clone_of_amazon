import 'package:clone_of_amazon/features/cart/services/cart_services.dart';
import 'package:clone_of_amazon/features/product_details/services/product_detail_service.dart';
import 'package:clone_of_amazon/models/product_model.dart';
import 'package:clone_of_amazon/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({super.key, required this.index});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final ProductDetailService productDetailService = ProductDetailService();
  final CartServices cartServices = CartServices();

  void increaseQty(ProductModel product) {
    productDetailService.addToCart(
      context: context,
      product: product,
    );
  }

  void removeFromCart(ProductModel product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = ProductModel.fromMap(productCart['product']);
    final quantity = productCart['quantity'];
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
                width: 100,
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
        Container(
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => removeFromCart(product),
                      child: Container(
                        width: 30,
                        height: 28,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.remove,
                          size: 16,
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1.5),
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 30,
                        height: 28,
                        alignment: Alignment.center,
                        child: Text(quantity.toString()),
                      ),
                    ),
                    InkWell(
                      onTap: () => increaseQty(product),
                      child: Container(
                        width: 30,
                        height: 28,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
