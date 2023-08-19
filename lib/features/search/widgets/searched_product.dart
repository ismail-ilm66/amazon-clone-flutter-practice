import 'package:amazon_clone/common/widgets/ratings_bar.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: const RatingsBarWidget(rating: 2.5),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '\$${product.price}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  'In Stocl',
                  style: TextStyle(color: Colors.teal),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
