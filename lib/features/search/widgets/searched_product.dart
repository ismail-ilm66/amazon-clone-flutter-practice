import 'package:amazon_clone/common/widgets/ratings_bar.dart';
import 'package:amazon_clone/features/product_detail/screen/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchedProduct extends StatelessWidget {
  final Product product;
  SearchedProduct({super.key, required this.product});

  void gotoDetailsScreen(BuildContext context) {
    Navigator.pushNamed(context, ProductDetails.routeName, arguments: product);
  }

  double avgRating = 0;
  double myRating = 0;
  @override
  Widget build(BuildContext context) {
    double totalRating = 0;

    if (product.rating!.isNotEmpty) {
      print('in if condition');
      for (int i = 0; i < product.rating!.length; i++) {
        totalRating += product.rating![i].rating;
        if (product.rating![i].userId ==
            Provider.of<UserProvider>(context, listen: false).user.id) {
          myRating = product.rating![i].rating;
        }
      }
      avgRating = totalRating / product.rating!.length;
    }
    return GestureDetector(
      onTap: () {
        gotoDetailsScreen(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
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
                  child: RatingsBarWidget(
                    rating: myRating != 0 ? myRating : avgRating,
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
      ),
    );
  }
}
