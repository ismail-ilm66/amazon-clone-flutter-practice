import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_text_form_field.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils..dart';
import 'package:amazon_clone/features/admin/services/admins_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const String routeName = '/add-product';
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _pnameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  bool isAdding = false;
  final formKey = GlobalKey<FormState>();

  final AdminServices adminServices = AdminServices();
  List<File> images = [];

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Book',
    'Fashion',
  ];
  String category = 'Mobiles';

  void selectImages() async {
    final res = await pickImages();
    setState(() {
      images = res;
    });
    print(images);
  }

  void AddProduct() {
    if (formKey.currentState!.validate() && images.isNotEmpty) {
      setState(() {
        isAdding = true;
      });
      adminServices.sellProduct(
        context: context,
        name: _pnameController.text,
        description: _descController.text,
        price: double.parse(_priceController.text),
        quantitiy: double.parse(_quantityController.text),
        category: category,
        images: images,
      );
      setState(() {
        isAdding = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pnameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
  }

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
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                images.isNotEmpty
                    ? CarouselSlider.builder(
                        itemCount: images.length,
                        itemBuilder: (context, index, i) {
                          return Image.file(
                            height: 200,
                            fit: BoxFit.cover,
                            images[index],
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          strokeWidth: 2,
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
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
                      ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: _pnameController,
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _descController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _priceController,
                  hintText: 'Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _quantityController,
                  hintText: 'Quantity',
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    onChanged: (v) {
                      setState(() {
                        category = v!;
                      });
                    },
                    value: category,
                    items: productCategories
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                isAdding
                    ? const CircularProgressIndicator()
                    : CustomButton(onTap: AddProduct, label: 'Sell'),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
