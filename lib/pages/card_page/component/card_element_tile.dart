import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/models/basket_model.dart';
import 'package:shopping_app/service/color_service.dart';

class CardElementTile extends StatefulWidget {
  final BasketElement basketElement;
  final VoidCallback onPressed;
  final VoidCallback update;
  const CardElementTile({super.key, required this.basketElement, required this.onPressed, required this.update});

  @override
  State<CardElementTile> createState() => _CardElementTileState();
}

class _CardElementTileState extends State<CardElementTile> {
  final color = AppColors.randomOchColor();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 20),
         Container(
          height: 100,
          width: 100,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(14),
              color: color
          ),
          child: Image(image: AssetImage(widget.basketElement.product.imageUrl)),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              widget.basketElement.product.name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 3,
              ),
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton.filledTonal(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFFECF1F8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: widget.onPressed,
                  icon: Icon(
                    CupertinoIcons.delete,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  widget.basketElement.count.toString(),
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 12),
                IconButton.filledTonal(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFFECF1F8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    widget.basketElement.count++;
                    setState(() {
                      widget.update();
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.plus,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
                Spacer(),
                Text(
                  "\$${widget.basketElement.product.price}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
