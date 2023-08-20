import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/ratings_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/product_detail/services/product_details_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/product-details-screen';
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  const RatingsBarWidget(rating: 4)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.topLeft,
              child: Text(
                widget.product.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            CarouselSlider.builder(
              itemCount: widget.product.imagesUrl.length,
              itemBuilder: (context, index, i) {
                return Image.network(
                  widget.product.imagesUrl[index],
                  fit: BoxFit.contain,
                );
              },
              options: CarouselOptions(
                height: 300,
                enableInfiniteScroll: false,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 5,
              color: Colors.black12,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  const Text(
                    'Deal Price:',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' \$${widget.product.price}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 21,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(5.0),
              child: Text(
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15),
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce efficitur tellus et placerat mollis. Vivamus euismod ut dui quis ultrices. Ut venenatis sodales molestie. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus felis nunc, efficitur nec pretium placerat, pharetra ut tellus. Praesent mollis eget quam ut posuere. Praesent non finibus ex. Integer blandit nisi et elementum congue. Sed mauris odio, semper quis neque consequat, porta luctus elit. Donec dapibus rutrum rhoncus.'),
            ),
            Container(
              height: 5,
              color: Colors.black12,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: CustomButton(onTap: () {}, label: 'Buy Now'),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: CustomButton(
                onTap: () {},
                label: 'Add to Cart',
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
            Container(
              padding: const EdgeInsets.only(
                top: 4,
                left: 10.0,
                right: 10.0,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Rate The Product',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            RatingBar.builder(
                maxRating: 5,
                minRating: 1,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: GlobalVariables.secondaryColor,
                  );
                },
                onRatingUpdate: (val) {
                  productDetailsServices.rateProduct(
                      context: context, product: widget.product, rating: val);
                }),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
