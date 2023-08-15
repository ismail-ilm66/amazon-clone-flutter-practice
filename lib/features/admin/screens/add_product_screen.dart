import 'package:amazon_clone/constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const String routeName = '/add-product';
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
          centerTitle: true,
          title: const Text(
            'Add Product',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_backspace_outlined),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                DottedBorder(
                  strokeWidth: 2,
                  dashPattern: const [9, 9],
                  child: Container(
                    // margin: const EdgeInsets.symmetric(
                    //   vertical: 15, horizontal: 10),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      //  border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_open_rounded,
                          size: 60,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Select Product Images',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
