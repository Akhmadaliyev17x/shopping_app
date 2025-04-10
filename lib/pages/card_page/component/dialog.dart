import 'package:flutter/material.dart';

import '../../../service/color_service.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String text;
  final String posText;
  final String negativeText;
  final VoidCallback? onPressedPositive;
  final VoidCallback? onPressedNegative;

  const CustomDialog({super.key, required this.title, required this.text, required this.posText, required this.negativeText, this.onPressedPositive, this.onPressedNegative});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: onPressedNegative,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: AppColors.kok
                        )
                    ),
                    child: Text(negativeText , style: TextStyle(color: AppColors.kok , fontWeight: FontWeight.w600),),
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: MaterialButton(
                    onPressed: onPressedPositive,
                    height: 50,
                    color: AppColors.kok,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(posText , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
