import 'package:flutter/material.dart';
import 'package:shopping_app/models/pay_model.dart';
import 'package:shopping_app/pages/checkout_payment/checkout/checkout_page.dart';
import 'package:shopping_app/pages/checkout_payment/payment_method/payment_method_page.dart';
import 'package:shopping_app/pages/checkout_payment/shipping_address/shipping_adress.dart';
import 'package:shopping_app/pages/reser_password/input_email_page.dart';
import 'package:shopping_app/pages/reser_password/instructions_sent_page.dart';
import 'package:shopping_app/pages/reser_password/successful_saved_page.dart';
import 'package:shopping_app/pages/welcome/welcome_page/welcome_page.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
