import 'package:flutter/material.dart';
import 'package:shopping_app/companents/df_appbar.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defAppBar(context: context, title: "Shipping Address"),
      body: Column(
        children: [
          Divider(),
          DropdownMenu(
            label: Text("data"),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 0, label: "1"),
              DropdownMenuEntry(value: 0, label: "2"),
              DropdownMenuEntry(value: 0, label: "3"),
              DropdownMenuEntry(value: 0, label: "4"),
            ],
          )
        ],
      ),
    );
  }
}
