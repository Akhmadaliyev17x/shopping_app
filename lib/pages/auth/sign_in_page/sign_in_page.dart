import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/custom_outlined_button.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/pages/reser_password/input_email_page.dart';
import 'package:shopping_app/service/color_service.dart';
import 'package:shopping_app/service/data/data.dart';

import '../../product/products_list_page/product_list_page.dart';
import '../sign_up_page/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in successful')),
      );
      Navigator.pushReplacement(context, DialogRoute(context: context, builder: (context)=> ProductListPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: DefaultTextStyle(
        style: GoogleFonts.notoSans(),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Textlvl1(
                    text: "Sign In",
                    color: AppColors.textColorOch,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: TextStyle(fontWeight: FontWeight.w600),
                  validator: (String? input) {
                    if (input == null || input.isEmpty) {
                      return "Please Enter Your Email";
                    } else if (!Data.users.any((e) => e.email == input)) {
                      return "Invalid Email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  obscureText: true,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  validator: (String? input) {
                    if (input == null || input.isEmpty) {
                      return "Please Enter Your Password";
                    } else if (!Data.users.any((e) => e.email == emailController.text && e.password == input )) {
                      return "Invalid Password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: "Sign In",
                  onPressed: _submitForm,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 14,
                ),
                CustomOutlinedButton(
                  onPressed: () {},
                  text: "Sign in with Facebook",
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have account?",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> SignUpPage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.w700 , color: AppColors.kok),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>InputEmailPage()));
                    },
                    child: Text(
                      "Forgot password",
                      style: TextStyle(
                        color: AppColors.textColorOch,
                        fontWeight: FontWeight.w600,
                      ),
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
