import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDealOfDay();
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? LoadingBarWidget()
        : product!.name.isEmpty
            ? const SizedBox()
            : Card(
                color: Colors.white,
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
                        children: [
                          Image.network(
                            'https://images.unsplash.com/photo-1669888940542-bf597f76ef39?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                          Image.network(
                            'https://images.unsplash.com/photo-1661268213353-3f7a8b2929cc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=739&q=80',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                          Image.network(
                            'https://images.unsplash.com/photo-1626218174358-7769486c4b79?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                          Image.network(
                            'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
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
