import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  final double _bottomNavBarWidth = 42;
  final double _bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text('Analytics Page'),
    ),
    const Center(
      child: Text('Messages Page'),
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
          //This Item is for Analytics

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
                Icons.analytics_outlined,
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
              child: const Icon(
                Icons.all_inbox_outlined,
              ),
            ),
            label: '',
          ),
        ],
      ),
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
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets\/images\/amazon_in.png',
                  height: 45,
                  width: 120,
                  color: Colors.black,
                ),
              ),
              Text(
                'Admin',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: pages[_page],
    );
  }
}
