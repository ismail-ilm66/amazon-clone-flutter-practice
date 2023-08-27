import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/order%20details/screens/order_details_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  AccountServices accountServices = AccountServices();
  List<Order>? orders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.getAllOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const LoadingBarWidget()
        : orders!.isEmpty
            ? const Center(
                child: Text('No Orders Found'),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Your Orders',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            // fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: GlobalVariables.selectedNavBarColor,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 172,
                      padding: const EdgeInsets.only(top: 10, right: 0),
                      //color: GlobalVariables.selectedNavBarColor,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, OrderDetailsScreen.routeName,
                                  arguments: orders![index]);
                            },
                            child: SingleProduct(
                              imageUrl: orders![index].products[0].imagesUrl[0],
                            ),
                          );
                        },
                        itemCount: orders!.length,
                      ),
                    )
                  ],
                ),
              );
  }
}
