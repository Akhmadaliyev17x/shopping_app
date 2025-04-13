import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/color_service.dart';

class Textlvl1 extends StatelessWidget {
  final String text;
  final Color? color;
  const Textlvl1({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: color ?? AppColors.textColor,
          fontSize: 34,
          fontWeight: FontWeight.w500),
    );
  }
}
