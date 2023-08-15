import 'package:amazon_clone/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatefulWidget {
  const CarouselImage({super.key});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: GlobalVariables.carouselImages.length,
      itemBuilder: (context, index, i) {
        return Image.network(
          height: 200,
          fit: BoxFit.cover,
          GlobalVariables.carouselImages[index],
        );
      },
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
