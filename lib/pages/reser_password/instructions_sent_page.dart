import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_back_button.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/pages/reser_password/new_password_page.dart';
import 'package:shopping_app/service/color_service.dart';

class InstructionsSentPage extends StatelessWidget {
  const InstructionsSentPage({
    super.key, required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: AppColors.backgroundColor,
        leading: CustomBackButton(),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Align(
        alignment: Alignment(0, -0.5),
        child: DefaultTextStyle(
          style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textColorOch),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage("assets/images/item.png"),
                height: 200,
                width: 200,
              ),
              Textlvl1(
                text: "Instructions sent!",
                color: AppColors.textColorOch,
              ),
              SizedBox(
                height: 7,
              ),
              Text("Check your inbox and follow the"),
              Text("instructions to reset your password."),
              SizedBox(
                height: 22,
              ),
              CustomButton(
                text: "Go to Email",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => NewPasswordPage(user:  user,)));
                },
                height: 72,
              )
            ],
          ),
        ),
      ),
    );
  }
}
