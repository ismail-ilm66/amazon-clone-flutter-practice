import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:amazon_clone/features/home/screens/cat_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/product_detail/screen/product_details_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: routeSettings,
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: routeSettings,
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const HomeScreen();
        },
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
        settings: routeSettings,
      );

    case CategoryDeals.routeName:
      String category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryDeals(
          category: category,
        ),
        settings: routeSettings,
      );

    case SearchScreen.routeName:
      String query = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => SearchScreen(query: query),
        settings: routeSettings,
      );

    case ProductDetails.routeName:
      Product product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        builder: (_) => ProductDetails(product: product),
        settings: routeSettings,
      );

    case CartPage.routeName:
      return MaterialPageRoute(
        builder: (_) => CartPage(),
        settings: routeSettings,
      );

    default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        );
      });
  }
}
