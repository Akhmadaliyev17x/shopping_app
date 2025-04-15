import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/df_appbar.dart';
import 'package:shopping_app/models/pay_model.dart';
import 'package:shopping_app/pages/checkout_payment/payment_method/payment_method_page.dart';
import 'package:shopping_app/pages/checkout_payment/shipping_address/companents/drop_down_countries.dart';
import 'package:shopping_app/pages/checkout_payment/shipping_address/companents/text_form_field_foraddress.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formtext = GlobalKey<FormState>();

  TextEditingController cityController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  late String country;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formtext,
      child: Scaffold(
        appBar: defAppBar(context: context, title: 'Shipping Address'),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
          child: DefaultTextStyle(
            style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.black45,
                fontWeight: FontWeight.w500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                ),
                DropDownCountries(
                    formKey: _formKey,
                    onValueSelected: (inp) {
                      country = inp ?? "Uzbekistan";
                    }),
                Divider(),
                SizedBox(
                  height: 37,
                ),
                CustomTextFormField(
                    controller: cityController,
                    labelText: "Town/City",
                    onErrorText: "Write Your Address"),
                Divider(),
                SizedBox(
                  height: 37,
                ),
                TextFormField(
                  validator: (inp) {
                    if (inp == null || inp.isEmpty) {
                      return "Enter postcode";
                    } else if (int.tryParse(inp) == null) {
                      return "Invalid postcode";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: postCodeController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text("Postcode"),
                    labelStyle: GoogleFonts.inter(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 37,
                ),
                CustomTextFormField(
                    controller: streetController,
                    labelText: "Street",
                    onErrorText: "Write Your Street"),
                Divider(),
                SizedBox(
                  height: 8,
                ),
                Text("This will be your default shipping address"),
                Text("This will be your default billing address"),
                Spacer(),
                CustomButton(
                  height: 75,
                  width: double.infinity,
                  text: "Next",
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _formtext.currentState!.validate()) {
                      Address address = Address(
                        country: country,
                        city: cityController.text,
                        postCode: int.parse(postCodeController.text),
                        street: streetController.text,
                      );
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>PaymentMethodPage(address: address)));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
