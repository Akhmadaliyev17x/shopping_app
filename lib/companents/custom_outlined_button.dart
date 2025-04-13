import 'package:flutter/material.dart';

import '../service/color_service.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Size? size;
  final VoidCallback? onPressed;
  const CustomOutlinedButton({super.key, required this.text, this.size, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          fixedSize: size ?? Size(999, 58),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9)
          ),
          side: BorderSide(
              color: AppColors.kok
          )
      ),
      child: Text(text , style: TextStyle(fontWeight: FontWeight.w700 , color: AppColors.kok),),


    );
  }
}
