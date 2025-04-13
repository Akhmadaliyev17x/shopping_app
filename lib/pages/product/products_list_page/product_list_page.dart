import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/grid_icon.dart';
import 'package:shopping_app/companents/gridproduct_companent.dart';
import 'package:shopping_app/companents/tabbar_tab_element.dart';
import 'package:shopping_app/companents/textLvl1.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/service/color_service.dart';
import 'package:shopping_app/service/data/data.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Textlvl1(text: "Product List"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 28,
                  color: AppColors.textColor,
                )),
            SizedBox(
              width: 14,
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: AppColors.textColor,
            indicatorColor: Colors.orangeAccent,
            dividerColor: Colors.transparent,
            tabs: [
              TabElement(text: "New"),
              TabElement(text: "Furniture"),
              TabElement(text: "Electronic"),
              TabElement(text: "Fashion"),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8,
              children: [
                Row(
                  children: [Spacer(), GridIcon()],
                ),
                GridView.extent(
                  shrinkWrap: true,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 5,
                  children: [
                    for (int i = 0; i < Data.products.length; i++)
                      ProductGridComponent(
                        product: Data.products[i],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
