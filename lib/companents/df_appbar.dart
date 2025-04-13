import 'package:flutter/material.dart';
import 'package:shopping_app/companents/custom_back_button.dart';

AppBar defAppBar({required BuildContext context, required String title ,   Widget? additionalIcon ,}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: CustomBackButton(),
    leadingWidth: 100,
    bottom: Tab(
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              title,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: Alignment(0.9, 0),
            child: additionalIcon,
          )
        ],
      ),
    ),
  );
}
