import 'package:flutter/material.dart';

AppBar defAppBar({required BuildContext context, required String title ,   Widget? additionalIcon ,}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(Icons.arrow_back_ios),
          Text("Back"),
        ],
      ),
    ),
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
