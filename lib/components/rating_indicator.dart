import 'package:caribe/components/units_indicator.dart';
import 'package:caribe/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingIndicator extends StatelessWidget {
  final double rating;

  const RatingIndicator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UnitsIndicator(
          value: rating,
          unit: "estrella",
          decimals: 1,
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                initialRating: rating,
                itemSize: 20,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                ignoreGestures: true,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: AppColors.naranjaAtardecer,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
