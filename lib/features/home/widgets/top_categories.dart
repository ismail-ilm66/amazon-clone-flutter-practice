import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/cat_deals_screen.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  void navigateToDealsScreen(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDeals.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemExtent: 80,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToDealsScreen(
              context,
              GlobalVariables.categoryImages[index]['title']!,
            ),
            child: Container(
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
            ),
          );
        },
        itemCount: GlobalVariables.categoryImages.length,
      ),
    );
  }
}
