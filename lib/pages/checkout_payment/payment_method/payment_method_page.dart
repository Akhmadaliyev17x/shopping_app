import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/df_appbar.dart';
import 'package:shopping_app/models/pay_model.dart';
import 'package:shopping_app/pages/checkout_payment/checkout/checkout_page.dart';
import 'package:shopping_app/pages/checkout_payment/payment_method/component/custom_card.dart';
import 'package:shopping_app/pages/checkout_payment/shipping_address/companents/text_form_field_foraddress.dart';
import 'package:shopping_app/service/color_service.dart';

class PaymentMethodPage extends StatefulWidget {
  final Address address ;
  PaymentMethodPage({super.key, required this.address});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int selectedIndex = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  bool? isSelected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defAppBar(context: context, title: "Payment Method"),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 45,
                ),
                SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 16,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: AnimatedCard(
                            isSelected: selectedIndex == 0,
                            imgUrl: "assets/images/cards/mastercard.png",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: AnimatedCard(
                            isSelected: selectedIndex == 1,
                            imgUrl: "assets/images/cards/visa.png",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: AnimatedCard(
                            isSelected: selectedIndex == 2,
                            imgUrl: "assets/images/cards/paypal.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                CustomTextFormField(
                    controller: nameController,
                    labelText: "Name",
                    onErrorText: "Please Enter your name"),
                Divider(),
                Spacer(),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (inp) {
                    if (inp == null || inp.isEmpty) {
                      return "Please Enter Card Number";
                    } else if (int.tryParse(inp) == null || inp.length != 16) {
                      return "invalid card number";
                    } else {
                      return null;
                    }
                  },
                  controller: cardNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("Card Number"),
                    labelStyle: GoogleFonts.inter(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(),
                Spacer(),
                CustomTextFormField(
                    controller: dataController,
                    labelText: "Expiry date",
                    onErrorText: "Invalid Data"),
                Divider(),
                Spacer(),
                TextFormField(
                  maxLength: 3,
                  validator: (inp) {
                    if (inp == null || inp.isEmpty) {
                      return "Please Enter CVC code";
                    } else if (int.tryParse(inp) == null || inp.length != 3) {
                      return "invalid CVC";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: cvvController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("CVC"),
                    labelStyle: GoogleFonts.inter(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(),
                Spacer(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CupertinoCheckbox(
                        shape: StadiumBorder(),
                        checkColor: AppColors.kok,
                        activeColor: AppColors.kok,
                        value: isSelected,
                        onChanged: (value) {
                          isSelected = value;
                          setState(() {});
                        },
                      ),
                      Text(
                        "Set as your default payment method",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                CustomButton(
                  text: "Next",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String type = selectedIndex == 0
                          ? "mastercard"
                          : selectedIndex == 1
                              ? "visa"
                              : "paypal";
                      CardModel card = CardModel(
                        name: nameController.text,
                        type: type,
                        number: cardNumberController.text,
                        dateTime: dataController.text,
                        cvv: int.parse(cvvController.text),
                      );
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> CheckoutPage(pay: Pay(card, address: widget.address))));
                    }
                  },
                  height: 75,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
