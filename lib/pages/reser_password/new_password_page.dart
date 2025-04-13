import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/pages/reser_password/successful_saved_page.dart';
import 'package:shopping_app/service/color_service.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({super.key, required this.user});
  final User user;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Align(
        alignment: Alignment(0, -0.1),
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 320,
            child: Column(
              spacing: 28,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Textlvl1(
                  text: "New Password",
                  color: AppColors.textColorOch,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "New Password",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                  validator: (inp) {
                    if (inp == null || inp.isEmpty) {
                      return "Please create new password";
                    } else if (inp.length < 8) {
                      return "invalid password";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                  validator: (inp) {
                    if (inp == null || inp.isEmpty) {
                      return "Please Confirm Password";
                    } else if (inp != passwordController.text) {
                      return "Wrong";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomButton(
                  text: "Save",
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      user.password = passwordController.text;
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>SuccessfulSavedPage()));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
