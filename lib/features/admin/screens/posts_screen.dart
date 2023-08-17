import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admins_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import '../../account/widgets/single_product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminServices adminServices = AdminServices();
  List<Product>? productsList;
  bool gettingProducts = false;
  void gotoAddProdScreen() {
    Navigator.pushNamed(
      context,
      AddProductScreen.routeName,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProd();
  }

  void getProd() async {
    productsList = await adminServices.fetchProducts(context);
    //print(products);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return productsList == null
        ? const LoadingBarWidget()
        : Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: gotoAddProdScreen,
              backgroundColor: Colors.cyan[300],
              tooltip: 'Add Product',
            ),
            body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                ),
                itemCount: productsList!.length,
                itemBuilder: (context, index) {
                  final productData = productsList![index];
                  return Column(
                    children: [
                      Container(
                        height: 140,
                        //width: 150,
                        child:
                            SingleProduct(imageUrl: productData.imagesUrl[0]),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        //height: 40,
                        // color: Colors.amber, //
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                productData.name,
                                overflow: TextOverflow.ellipsis,
                                //maxLines: 2,
                              ),
                            ),
                            Icon(Icons.delete)
                          ],
                        ),
                      )
                    ],
                  );
                }),
          );
  }
}
