import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textlvl2 extends StatelessWidget {
  final String text;
  final Color? color;
  const Textlvl2({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }
}
