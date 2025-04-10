import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/product_list_page.dart';
import '../service/color_service.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height ;
  final Widget? child;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.text, this.onPressed,  this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      height: height ?? 65,
      minWidth: MediaQuery.sizeOf(context).width - 100,
      color: AppColors.kok,
      child: child ?? Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
