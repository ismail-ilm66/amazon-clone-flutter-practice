import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/services/admins_services.dart';
import 'package:amazon_clone/features/order%20details/screens/order_details_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  AdminServices adminServices = AdminServices();
  List<Order>? orders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllOrders();
  }

  void getAllOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orders == null
          ? const LoadingBarWidget()
          : orders!.isEmpty
              ? const Center(
                  child: Text('No Orders Yet!!'),
                )
              : GridView.builder(
                  itemCount: orders!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (conntext, index) {
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                            context, OrderDetailsScreen.routeName,
                            arguments: orders![index]);
                        getAllOrders();
                        setState(() {});
                      },
                      child: SingleProduct(
                        imageUrl: orders![index].products[0].imagesUrl[0],
                      ),
                    );
                  },
                ),
    );
  }
}
