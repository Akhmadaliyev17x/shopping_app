import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_back_button.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/pages/auth/sign_in_page/sign_in_page.dart';
import 'package:shopping_app/service/color_service.dart';

class SuccessfulSavedPage extends StatelessWidget {
  const SuccessfulSavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leadingWidth: 100,
        leading: CustomBackButton(),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Align(
        alignment: Alignment(0, -0.2),
        child: DefaultTextStyle(
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.textColorOch
          ),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              Textlvl1(text: "New Password" , color: AppColors.textColorOch,),
              Text("You successfully reset your password."),
              Text("Please use your new password to sign in."),
              SizedBox(height: 8,),
              CustomButton(text: "Sign In", onPressed: (){
                Navigator.pushAndRemoveUntil(context, DialogRoute(context: context, builder: (context)=>SignInPage()), (route) => false);
              },),
            ],
          ),
        ),
      ),
    );
  }
}
