import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/features/home/widgets/address_contaiener.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart-page';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      body: Column(children: [
        const AdressBar(),
        CartSubtotal(),
      ]),
    );
  }
}
