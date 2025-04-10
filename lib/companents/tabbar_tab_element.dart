import 'package:flutter/material.dart';

class TabElement extends StatelessWidget {
  final String text;
  const TabElement({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: EdgeInsets.only(right: 12),
        child: Text(text),
      ),
    );
  }
}
