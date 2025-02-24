import 'package:clone_of_amazon/common/widgets/loader.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/home/widgets/address_box.dart';
import 'package:clone_of_amazon/features/product_details/screens/product_detail_screen.dart';
import 'package:clone_of_amazon/features/search/services/search_services.dart';
import 'package:clone_of_amazon/features/search/widgets/searched_products.dart';
import 'package:clone_of_amazon/models/product_model.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search-screen";
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ProductModel>? productList;
  final SearchServices services = SearchServices();
  fetchSearchedProduct() async {
    productList = await services.fetchSearchProduct(
      context: context,
      searchQuery: widget.searchQuery,
    );
    setState(() {});
  }

  @override
  void initState() {
    fetchSearchedProduct();
    super.initState();
  }

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
      body: productList == null
          ? Loader()
          : Column(
              children: [
                AddressBox(),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: productList!.length,
                    itemBuilder: (context, index) {
                      final product = productList![index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetailScreen.routeName,
                              arguments: product,
                            );
                          },
                          child: SearchedProducts(product: product));
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
