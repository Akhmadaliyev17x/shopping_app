import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_button.dart';
import 'package:shopping_app/companents/df_appbar.dart';
import 'package:shopping_app/service/data/data.dart';

import '../../../service/data/data_controller.dart';
import 'component/card_element_tile.dart';
import 'component/dialog.dart';
import 'empty_card_page.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  @override
  Widget build(BuildContext context) {
    DataController.updateSum();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defAppBar(
        context: context,
        title: "Your Card",
        additionalIcon: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  title: "Empty Card",
                  text:
                      "Are you sure you want to delete all items in your card?",
                  posText: "Empty Card",
                  negativeText: "Cancel",
                  onPressedNegative: () {
                    Navigator.pop(context);
                  },
                  onPressedPositive: () {
                    Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_ , __ , ___)=> EmptyCardPage()));
                    Data.basket = [];
                  },
                ),
              );
            },
            icon: Icon(CupertinoIcons.delete)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${Data.basket.length} items",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 25,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: Data.basket.length,
                itemBuilder: (context, index) {
                  return CardElementTile(
                    basketElement: Data.basket[index],
                    onPressed: () {
                      DataController.removeOrDelete(
                          context, Data.basket[index].product, () {
                        setState(() {});
                      });
                      log("Length: ${Data.basket.length.toString()}");
                    },
                    update: () {
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Data.basket.isEmpty
          ? SizedBox.shrink()
          : ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 16),
                child: CustomButton(
                  text: "text",
                  onPressed: () {},
                  height: 84,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Check out",
                        style: TextStyle(color: Colors.white60, fontSize: 16),
                      ),
                      Text(
                        "\$${Data.sum}",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
