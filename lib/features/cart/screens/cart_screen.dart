import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/cart/widgets/cart_produts.dart';
import 'package:amazon_clone/features/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/features/home/widgets/address_contaiener.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  static const routeName = '/cart-page';
  CartPage({super.key});
  late int items;

  void gotoAddressScreen(BuildContext context, String sum) {
    Navigator.pushNamed(context, AddressScreen.routeName, arguments: sum);
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = 0.0;

    String i = 'Items';
    final user = Provider.of<UserProvider>(context, listen: true).user;
    final items = user.cart.length;
    if (items == 1) {
      i = 'Item';
    }
    final cartItems = user.cart;
    for (int i = 0; i < cartItems.length; i++) {
      subtotal += double.parse(cartItems[i]['product']['price'].toString()) *
          double.parse(cartItems[0]['quantity'].toString());
    }
    print(items);
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
      body: Column(
        children: [
          const AdressBar(),
          CartSubtotal(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomButton(
              onTap: () {
                gotoAddressScreen(context, subtotal.toString());
              },
              label: 'Proceed To Buy($items $i)',
              buttonColor: Colors.amber[400],
              textColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 5,
            color: Colors.black12,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CartProducts(index: index);
              },
              itemCount: user.cart.length,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
