import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_text_form_field.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth-screen';
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: _auth == Auth.signUp
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundColor,
              leading: Radio(
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
              title: const Text('Create Account'),
            ),
            if (_auth == Auth.signUp)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _nameController, hintText: 'Name'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _emailController, hintText: 'Email'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _passController, hintText: 'Password'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onTap: () {},
                        label: 'Sign-Up',
                      ),
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signIn
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundColor,
              leading: Radio(
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
              title: const Text('Sign-In'),
            ),
            if (_auth == Auth.signIn)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _emailController, hintText: 'Email'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _passController, hintText: 'Password'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onTap: () {},
                        label: 'Sign-In',
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
