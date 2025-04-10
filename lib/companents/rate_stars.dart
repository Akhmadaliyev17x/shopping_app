import 'package:flutter/material.dart';

class RateStars extends StatelessWidget {
  final int rate;
  final double size;

  const RateStars({super.key, required this.rate, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 1; i <= rate; i++)
          Icon(
            Icons.star,
            color: Colors.orange,
            size: size,
          ),
        for (int i = 1; i <= 5 - rate; i++)
          Icon(
            Icons.star,
            color: Colors.grey.shade300,
            size: size,
          )
      ],
    );
  }
}
