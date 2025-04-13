import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/companents/custom_review_widget.dart';
import 'package:shopping_app/companents/df_appbar.dart';
import 'package:shopping_app/service/data/data.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defAppBar(
        context: context,
        title: "Reviews (45)",
      ),
      backgroundColor: Colors.white,
      body: DefaultTextStyle(
        style: GoogleFonts.poppins(),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return CustomReviewWidget(comment: Data.reviews[index]);
            },
            separatorBuilder: (_, i) {
              return Divider();
            },
            itemCount: Data.reviews.length),
      ),
    );
  }
}
