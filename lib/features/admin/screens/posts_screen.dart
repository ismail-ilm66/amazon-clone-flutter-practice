import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/constants/utils..dart';
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

  void deleteProduct(Product product) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          productsList!.remove(product);
        });
    showSnackBar(context, 'The Product Has been Deleted Successfully');
  }

  @override
  Widget build(BuildContext context) {
    return productsList == null
        ? const LoadingBarWidget()
        : Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: gotoAddProdScreen,
              backgroundColor: Colors.cyan[300],
              tooltip: 'Add Product',
              child: const Icon(Icons.add),
            ),
            body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                ),
                itemCount: productsList!.length,
                itemBuilder: (context, index) {
                  final productData = productsList![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        //width: 150,
                        child:
                            SingleProduct(imageUrl: productData.imagesUrl[0]),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
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
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    deleteProduct(productsList![index]);
                                  },
                                  icon: const Icon(Icons.delete)),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          );
  }
}
