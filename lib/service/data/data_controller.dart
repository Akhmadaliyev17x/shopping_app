import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:shopping_app/models/basket_model.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/service/data/data.dart';

import '../../pages/card/card_page/component/dialog.dart';

sealed class DataController {
  static addToCard(Product product) {
    var isCreated = false;
    for (var e in Data.basket) {
      if (e.product.name == product.name) {
        isCreated = true;
        e.count++;
      }
    }
    if (!isCreated) {
      Data.basket.add(BasketElement(product: product, count: 1));
    }
  }

  static removeOrDelete(BuildContext context, Product product, VoidCallback update) {
    int tanlanganIndex = 0;
    for (int i = 0; i < Data.basket.length; i++) {
      if (Data.basket[i].product.name == product.name) {
        tanlanganIndex = i;
        break;
      }
    }
    if (Data.basket[tanlanganIndex].count < 2) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: "Delete ${product.name}",
            text:
                "Are you sure you want to delete ${product.name} from your card?",
            posText: "Delete",
            negativeText: "Cancel",
            onPressedNegative: () {
              Navigator.pop(context);
            },
            onPressedPositive: (){
              log("Inside the function: $tanlanganIndex");
              Data.basket.removeAt(tanlanganIndex);
              Navigator.pop(context);
              log(Data.basket.length.toString());
              update();
            },
          );
        },
      );
    } else {
      Data.basket[tanlanganIndex].count--;
      update();
    }
  }

  static updateSum(){
    Data.sum = 0;
    for (var e in Data.basket) {
      Data.sum+= (e.product.price*e.count);
    }
  }
}
