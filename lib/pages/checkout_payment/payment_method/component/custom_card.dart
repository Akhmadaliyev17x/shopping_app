import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  final String imgUrl;
  bool isSelected;
  AnimatedCard({super.key , required this.isSelected, required this.imgUrl});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.isSelected ? 80 : 60,
      width: widget.isSelected ? 120 : 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black45,
              offset: Offset(1, 1),
              blurRadius: 5),
        ],
      ),
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 8),
      child: Image(image: AssetImage(widget.imgUrl)),
    );
  }
}
