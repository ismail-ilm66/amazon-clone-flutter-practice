import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemExtent: 80,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    GlobalVariables.categoryImages[index]['image']!,
                    height: 40,
                    width: 40,
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: GlobalVariables.categoryImages.length,
      ),
    );
  }
}
