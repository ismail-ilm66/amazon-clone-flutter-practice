import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/widgets/address_contaiener.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widgets/searched_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  final String query;
  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchServices searchServices = SearchServices();
  List<Product>? products;
  void getProducts() async {
    products = await searchServices.getSearchedProducts(context, widget.query);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            backgroundColor: GlobalVariables.selectedNavBarColor,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        //   onFieldSubmitted: gotoSearchScreen,
                        decoration: InputDecoration(
                          hintText: 'Search Amazon.in',
                          // labelText: 'Search Amazon.in',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(top: 10),
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 42,
                  color: Colors.transparent,
                  child: const Icon(
                    Icons.mic,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: products == null
            ? const LoadingBarWidget()
            : Column(
                children: [
                  const AdressBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SearchedProduct(
                        product: products![index],
                      );
                    },
                    itemCount: products?.length,
                  ))
                ],
              ));
  }
}
