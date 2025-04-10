import 'package:flutter/material.dart';
import 'package:shopping_app/companents/rate_stars.dart';

import '../models/review_model.dart';

class CustomReviewWidget extends StatelessWidget {
  final Review comment ;
  const CustomReviewWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Row(mainAxisSize: MainAxisSize.min, children: [
            RateStars(
              rate: comment.rate,
              size: 14,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              comment.dateTime,
              style: TextStyle(fontSize: 12, color: Colors.black87),
            )
          ]),
          leading: CircleAvatar(
            backgroundImage: AssetImage(comment.imageUrl),
          ),
        ),
        ListTile(
          title: Text(
            comment.title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text( comment.comment, style: TextStyle(color: Colors.black54),),
        )
      ],
    );
  }
}
