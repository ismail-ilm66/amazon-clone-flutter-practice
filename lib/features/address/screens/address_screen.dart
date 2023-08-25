import 'package:amazon_clone/common/widgets/custom_text_form_field.dart';
import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils..dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = '/adress-screen';
  final String sum;
  const AddressScreen({super.key, required this.sum});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController houseNoController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<PaymentItem> googlePayItems = [];
  String addressToBeUsed = '';

  void onGooglePayResult(res) {}

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";
    bool isForm = houseNoController.text.isNotEmpty ||
        codeController.text.isNotEmpty ||
        cityController.text.isNotEmpty ||
        streetController.text.isNotEmpty;

    if (isForm) {
      if (_formKey.currentState!.validate()) {
        addressToBeUsed =
            "${houseNoController.text},${streetController.text}-${codeController.text},${cityController.text}";
      } else {
        throw Exception('Please Enter all the values');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'Error');
    }
    print(addressToBeUsed);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googlePayItems.add(
      PaymentItem(
          amount: widget.sum,
          label: 'Total Amount',
          status: PaymentItemStatus.final_price),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    houseNoController.dispose();
    codeController.dispose();
    cityController.dispose();
    streetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    // address = '101 fake city';
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
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                address.isNotEmpty
                    ? Container(
                        child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 1.5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              address,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: const Text(
                              'Or',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ))
                    : Container(
                        height: 4,
                        color: Colors.black12,
                      ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  borderColor: Colors.black12,
                  controller: houseNoController,
                  hintText: 'Flat, House No. Building No.',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  borderColor: Colors.black12,
                  controller: streetController,
                  hintText: 'Area, Street',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  borderColor: Colors.black12,
                  controller: codeController,
                  hintText: 'Pincode',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  borderColor: Colors.black12,
                  controller: cityController,
                  hintText: 'Town / City',
                ),
                const SizedBox(
                  height: 10,
                ),
                GooglePayButton(
                  onPressed: () => payPressed(address),
                  width: double.infinity,
                  type: GooglePayButtonType.buy,
                  height: 50,
                  loadingIndicator: const LoadingBarWidget(),
                  margin: EdgeInsets.only(top: 10),
                  paymentConfigurationAsset: 'gpay.json',
                  onPaymentResult: onGooglePayResult,
                  paymentItems: googlePayItems,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
