import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/rate_stars.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/pages/detail_page.dart';

import '../service/color_service.dart';

class ProductGridComponent extends StatelessWidget {
  final Product product;

  const ProductGridComponent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      DetailPage(context: context, product: product);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.randomOchColor(),
                  borderRadius: BorderRadius.circular(8)),
              child: Image(image: AssetImage(product.imageUrl)),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                "\$${product.price}",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              trailing: Icon(
                Icons.more_horiz,
                color: AppColors.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
