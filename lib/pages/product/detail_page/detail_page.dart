import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/service/data/data_controller.dart';

import '../../../companents/rate_stars.dart';
import '../../../companents/textLvl1.dart';
import '../../../models/product_model.dart';
import '../../../service/color_service.dart';
import '../../card/card_page/card_page.dart';
import '../reviews_page/reviews_page.dart';

class DetailPage {
  BuildContext context;
  Product product;

  DetailPage({
    required this.context,
    required this.product,
  }) {
    _showFullBottomSheet(context, product);
  }

  void _showFullBottomSheet(BuildContext context, Product product) {
    Color color = AppColors.randomOchColor();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.sizeOf(context).height - 50,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12), topLeft: Radius.circular(12))),
          child: SingleChildScrollView(
            child: Column(
              spacing: 25,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.keyboard_arrow_down_sharp)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Textlvl1(text: product.name),
                ),
                Material(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Container(
                      alignment: Alignment(0.8, -0.8),
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(product.imageUrl),
                        ),
                      ),
                      child: Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "\$${product.price}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kok,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  product.type,
                  style:
                      GoogleFonts.poppins(color: Colors.black54, fontSize: 16),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20,
                  children: [
                    RateStars(
                      rate: product.rate,
                      size: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewsPage()));
                      },
                      child: Text(
                        "124 reviews",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
                CustomButton(
                  text: "Add to Card",
                  onPressed: () {
                    DataController.addToCard(product);
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => CardPage()));
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
