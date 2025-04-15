import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText ;
  final String onErrorText ;

  const CustomTextFormField({super.key, required this.controller, required this.labelText, required this.onErrorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (inp){
        if(inp == null || inp.isEmpty){
          return onErrorText;
        }else{
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: Text(labelText),

        labelStyle: GoogleFonts.inter(
            color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }
}
