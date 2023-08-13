import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  static const String routeName = 'actual-homescreen';

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  final double _bottomNavBarWidth = 42;
  final double _bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const Center(
      child: Text('Account Page'),
    ),
    const Center(
      child: Text('Cart Page'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (v) {
          setState(() {
            _page = v;
          });
        },
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unSelectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          //This Item is for Home
          BottomNavigationBarItem(
            icon: Container(
              width: _bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: _bottomBarBorderWidth,
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor!
                        : GlobalVariables.backgroundColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          //This Item is for Profile

          BottomNavigationBarItem(
            icon: Container(
              width: _bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: _bottomBarBorderWidth,
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor!
                        : GlobalVariables.backgroundColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
            label: '',
          ),
          //This Item is for Cart
          BottomNavigationBarItem(
            icon: Container(
              width: _bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: _bottomBarBorderWidth,
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor!
                        : GlobalVariables.backgroundColor,
                  ),
                ),
              ),
              child: const badges.Badge(
                badgeContent: Text('2'),
                badgeStyle: badges.BadgeStyle(
                  elevation: 0,
                  badgeColor: Colors.white,
                ),
                child: Icon(
                  Icons.shopping_cart_checkout_outlined,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
      body: pages[_page],
    );
  }
}
