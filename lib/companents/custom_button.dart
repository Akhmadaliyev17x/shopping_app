import 'package:flutter/material.dart';

import '../service/color_service.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height ;
  final double? width ;
  final Widget? child;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.text, this.onPressed,  this.height, this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      height: height ?? 65,
      minWidth: width ?? MediaQuery.sizeOf(context).width - 100,
      color: AppColors.kok,
      child: child ?? Text(
        text,
        style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 16 ),
      ),
    );
  }
}
