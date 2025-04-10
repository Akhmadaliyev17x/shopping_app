import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/pages/product_list_page.dart';
import 'package:shopping_app/service/color_service.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png") , fit: BoxFit.cover),
        ),
        child: Center(
          child: DefaultTextStyle(
            style: GoogleFonts.poppins(color: AppColors.kok, fontSize: 16),
            child: Column(
              spacing: 3,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                ),
                Spacer(),
                Text(
                  "SHOPIN",
                  style: GoogleFonts.tiltWarp(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    letterSpacing: 15,
                  ),
                ),
                Spacer(),
                Text(
                  "Amazing shopping",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                Text("Experience a new way"),
                Text("of shopping"),
                Spacer(
                  flex: 2,
                ),
                CustomButton(
                  text: "Explore",
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ProductListPage()));
                  },
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
