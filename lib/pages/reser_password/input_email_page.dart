import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_back_button.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/pages/reser_password/inherted_widget.dart';
import 'package:shopping_app/pages/reser_password/instructions_sent_page.dart';
import 'package:shopping_app/service/color_service.dart';
import 'package:shopping_app/service/data/data.dart';

class InputEmailPage extends StatelessWidget {
  InputEmailPage({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  late final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: CustomBackButton(),
        leadingWidth: 100,
      ),
      body: DefaultTextStyle(
        style: GoogleFonts.inter(
            color: AppColors.textColorOch,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        child: Align(
          alignment: Alignment(0, -0.2),
          child: Column(
            spacing: 6,
            mainAxisSize: MainAxisSize.min,
            children: [
              Textlvl1(
                text: "Password Reset",
                color: AppColors.textColorOch,
              ),
              SizedBox(
                height: 16,
              ),
              Text("Enter your email address. We`ll send"),
              Text("a link to reset your password"),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _key,
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    validator: (inp) {
                      if (inp == null || inp.isEmpty) {
                        return "Please Enter Your Email";
                      } else if (!Data.users.any((e) => e.email == inp)) {
                        return "Email Not Found";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Send",
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    for (var e in Data.users) {
                      if(e.email == controller.text){
                        user = e;
                        break;
                      }
                    }
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => InstructionsSentPage(user: user,)));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
