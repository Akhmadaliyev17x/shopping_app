import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/service/color_service.dart';
import 'package:shopping_app/service/data/data.dart';

import '../congratulations_page/congratulations_page.dart';
import '../sign_in_page/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      User user = User(name: nameController.text, email: emailController.text, password: passwordController.text);
      Data.users.add(user);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => CongratulationsPage(),
        ),
      );
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
                    text: "Sign Up",
                    color: AppColors.textColorOch,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: TextStyle(fontWeight: FontWeight.w600),
                  validator: (String? input) {
                    if (input == null || input.isEmpty) {
                      return "Please enter your name";
                    } else if (input.length < 3) {
                      return "Enter your name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
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
                    } else if (Data.users.any((e) => e.email == input)) {
                      return "Choose Another Email";
                    } else if (!input.endsWith("@gmail.com") ||
                        input.length < 12) {
                      return "Invalid Email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
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
                    } else if (input.length < 8) {
                      return "Invalid Password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  obscureText: true,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  validator: (String? input) {
                    if (input == null || input.isEmpty) {
                      return "Please Confirm Your Password";
                    } else if (input != passwordController.text) {
                      return "Invalid";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 38),
                CustomButton(
                  text: "Sign Up",
                  onPressed: _submitForm,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: AppColors.kok),
                      ),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
