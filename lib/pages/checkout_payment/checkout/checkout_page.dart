import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/df_appbar.dart';
import 'package:shopping_app/models/pay_model.dart';
import 'package:shopping_app/pages/auth/congratulations_page/congratulations_page.dart';
import 'package:shopping_app/pages/checkout_payment/checkout/component/bolim_title.dart';
import 'package:shopping_app/pages/checkout_payment/checkout/component/textlvl2.dart';
import 'package:shopping_app/pages/checkout_payment/payment_method/component/custom_card.dart';
import 'package:shopping_app/pages/product/products_list_page/product_list_page.dart';
import 'package:shopping_app/service/color_service.dart';
import 'package:shopping_app/service/data/data.dart';

class CheckoutPage extends StatelessWidget {
  final Pay pay;

  const CheckoutPage({super.key, required this.pay});

  @override
  Widget build(BuildContext context) {
    String imgUrl = pay.card.type;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12, right: 12, left: 12),
        child: CustomButton(
          height: 75,
          width: double.infinity,
          text: "",
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Place Order",
                style: TextStyle(color: Colors.white60),
              ),
              Textlvl2(
                text: Data.sum.toString(),
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                  builder: (context) => CongratulationsPage(
                    t1: "Your order has been successfully",
                    t2: "placed.",
                    buttonText: "Continue Shopping",
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductListPage()));
                    },
                  ),
                ),
                (_) => false);
            Data.basket = [];
          },
        ),
      ),
      backgroundColor: Colors.white,
      appBar: defAppBar(
        context: context,
        title: "Checkout",
      ),
      body: DefaultTextStyle(
        style: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16,
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
              child: SizedBox(
                height: 78,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BolimTitle(title: 'Shipping Address'),
                    SizedBox(
                      height: 8,
                    ),
                    Text(pay.address.street),
                    Text(
                        "${pay.address.postCode} ${pay.address.city} ${pay.address.country}"),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 34,
                vertical: 20,
              ),
              child: SizedBox(
                height: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BolimTitle(title: "Payment"),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedCard(
                        isSelected: false,
                        imgUrl: "assets/images/cards/$imgUrl.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(pay.card.number),
                    Text(pay.card.name),
                    Text(pay.card.dateTime),
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              SizedBox(
                width: 34,
              ),
              Textlvl2(text: "Review Products")
            ]),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                  child: SingleChildScrollView(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 16,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (int i = 0; i < Data.basket.length; i++)
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.randomOchColor(),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          Data.basket[i].product.imageUrl),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
