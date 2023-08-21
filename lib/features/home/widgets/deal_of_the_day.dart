import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_detail/screen/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  final HomeServices homeServices = HomeServices();
  Product? product;

  void getDealOfDay() async {
    product = await homeServices.getDealOftheDay(
      context: context,
    );
    setState(() {});
  }

  void navigateToDetailsScreen() {
    Navigator.pushNamed(context, ProductDetails.routeName, arguments: product);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDealOfDay();
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const LoadingBarWidget()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailsScreen,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Deal Of The Day',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.network(
                      product!.imagesUrl[0],
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, right: 40),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '\$${product!.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, right: 40),
                      alignment: Alignment.topLeft,
                      child: Text(
                        product!.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: product!.imagesUrl
                              .map(
                                (e) => Image.network(
                                  e,
                                  height: 100,
                                  width: 100,
                                ),
                              )
                              .toList()),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 15, left: 10),
                      child: Text(
                        'See All The Deals',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    )
                  ],
                ),
              );
  }
}
