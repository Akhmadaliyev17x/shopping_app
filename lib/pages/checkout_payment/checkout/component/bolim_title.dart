import 'package:flutter/material.dart';
import 'package:shopping_app/pages/checkout_payment/checkout/component/textlvl2.dart';

import 'change_button.dart';

class BolimTitle extends StatelessWidget {
  final String title;
  const BolimTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Textlvl2(text: title),
        Spacer(),
        ChangeButton(onPressed: (){
          if(title == "Payment"){
            Navigator.pop(context);
          }else{
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },),
      ],
    );
  }
}
