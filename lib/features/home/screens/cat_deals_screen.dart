import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class CategoryDeals extends StatefulWidget {
  static const routeName = '/category-deals';
  final String category;
  const CategoryDeals({super.key, required this.category});

  @override
  State<CategoryDeals> createState() => _CategoryDealsState();
}

class _CategoryDealsState extends State<CategoryDeals> {
  final HomeServices homeServices = HomeServices();
  List<Product>? productsList;

  void getProducts() async {
    productsList =
        await homeServices.getCategoryProducts(context, widget.category);
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
          title: Text(
            widget.category,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: productsList == null
          ? const LoadingBarWidget()
          : Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Keep Shopping for ${widget.category}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: productsList!.isEmpty
                      ? const Center(
                          child: Text(
                            'No Product Found',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      : GridView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.4,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: productsList!.length,
                          itemBuilder: (context, index) {
                            final productData = productsList![index];
                            return Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 0.5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                          productData.imagesUrl[0]),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 5, right: 15, left: 0),
                                  alignment: Alignment.topLeft,
                                  child: Text(productData.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            );
                          },
                        ),
                )
              ],
            ),
    );
  }
}
