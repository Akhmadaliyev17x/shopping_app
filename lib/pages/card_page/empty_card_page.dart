import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/pages/product_list_page.dart';

class EmptyCardPage extends StatelessWidget {
  const EmptyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultTextStyle(
          style: GoogleFonts.poppins(),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Lottie.asset("assets/anime/basket.json"),
              ),
              Text(
                "Your Card Is Empty",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              Text("Looking for ideas?"),
              SizedBox(height: 20,),
              CustomButton(text: "Explore New Products" , onPressed: (){
                // Navigator.push(context, PageRouteBuilder(pageBuilder: (context , _, __ )=> ProductListPage()));
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> ProductListPage()));
              },)
            ],
          ),
        ),
      ),
    );
  }
}
