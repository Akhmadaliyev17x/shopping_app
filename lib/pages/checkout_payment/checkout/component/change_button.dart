import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ChangeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onPressed,
      child: Text(
        "Change",
        style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.blue),
      ),
    );
  }
}
