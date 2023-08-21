import 'package:amazon_clone/features/product_detail/services/product_details_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProducts extends StatefulWidget {
  final int index;
  const CartProducts({super.key, required this.index});

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  void increaseCartQuantity(Product product) {
    productDetailsServices.addToCart(context: context, product: product);
  }

  void decreaseCartQuantity(Product product) {
    productDetailsServices.deleteFromCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    int totalItems = productCart['quantity'];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                product.imagesUrl[0],
                height: 135,
                width: 135,
                fit: BoxFit.fitWidth,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Eligible For Free Shipping',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'In Stock',
                      style: TextStyle(color: Colors.teal),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    decreaseCartQuantity(product);
                  },
                  child: Container(
                    height: 35,
                    width: 32,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.black12),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      color: const Color.fromARGB(66, 75, 73, 73),
                    ),
                    child: const Icon(Icons.remove, size: 19),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 32,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1.5,
                        color: Color.fromARGB(66, 75, 73, 73),
                      ),
                    ),
                  ),
                  child: Text(
                    totalItems.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                InkWell(
                  onTap: () {
                    increaseCartQuantity(product);
                  },
                  child: Container(
                    height: 35,
                    width: 32,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: Colors.black12),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        color: const Color.fromARGB(66, 44, 44, 44)),
                    child: const Icon(Icons.add, size: 19),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
