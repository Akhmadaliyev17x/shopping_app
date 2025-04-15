import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/service/color_service.dart';

import '../sign_in_page/sign_in_page.dart';

class CongratulationsPage extends StatelessWidget {
  final String? t1;
  final String? t2;
  final String? buttonText;

  final VoidCallback? onPressed;
  const CongratulationsPage({super.key, this.t1, this.t2, this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 28 , vertical: 70),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png") , fit: BoxFit.cover)
        ),
        child: DefaultTextStyle(
          style: GoogleFonts.poppins(
            fontSize: 20 ,
            fontWeight: FontWeight.w500,
            color: AppColors.textColorOch,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Textlvl1(text: "Congratulations" , color: AppColors.textColorOch,),
              SizedBox(height: 18,),
              Text(t1 ?? "Your Account has been"),
              Text(t2 ?? "successfully created."),
              Spacer(),
              CustomButton(text: buttonText ?? "Sign In" , onPressed : onPressed ?? (){
                Navigator.pushReplacement(context, DialogRoute(context: context, builder: (context)=>SignInPage()));
              },width: double.infinity,)
            ],
          ),
        ),
      ),
    );
  }
}
