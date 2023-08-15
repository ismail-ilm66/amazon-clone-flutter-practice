import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void gotoAddProdScreen() {
    Navigator.pushNamed(
      context,
      AddProductScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: gotoAddProdScreen,
        backgroundColor: Colors.cyan[300],
        tooltip: 'Add Product',
      ),
      body: Center(child: Text('Posts Screen')),
    );
  }
}
