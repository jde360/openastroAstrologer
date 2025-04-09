import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:open_astro/view/screens/my_profile/widgets/progressbar.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';

import '../../../../core/colors/color_pallet.dart';
import '../../../../core/font/app_font.dart';
import '../../../widgets/space.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: percentWidth(percent: 45),
                child: Column(
                  children: [
                    Text(
                      "4.8",
                      style: appText(size: 37, weight: FontWeight.w600),
                    ),
                    StarRating(
                      rating: 3.5,
                      allowHalfRating: false,
                      halfFilledIcon: Icons.star_half_rounded,

                      color: AppColor().rating,
                    ),
                    Text(
                      "4,981 review",
                      style: appText(size: 13, weight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: percentWidth(percent: 45),
                child: const Column(
                  children: [
                    ProgressbarWidget(value: 1, rating: '5'),
                    ProgressbarWidget(value: 0.8, rating: '4'),
                    ProgressbarWidget(value: 0.6, rating: '3'),
                    ProgressbarWidget(value: 0.4, rating: '2'),
                    ProgressbarWidget(value: 0.2, rating: '1'),
                  ],
                ),
              ),
            ],
          ),
          space(height: 34, width: 0),
          const Row(
            children: [
              RatingChip(isSelected: true, text: 'All'),
              RatingChip(isSelected: false, text: '5'),
              RatingChip(isSelected: false, text: '4'),
              RatingChip(isSelected: false, text: '3'),
              RatingChip(isSelected: false, text: '2'),
            ],
          ),
          space(height: 22, width: 0),
        ],
      ),
    );
  }
}

class RatingChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData? icon;
  const RatingChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 25,
        width: 61,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(5),
            // ),
            padding: const EdgeInsets.all(0),
            foregroundColor: isSelected ? Colors.black : AppColor().rating,
            backgroundColor:
                isSelected ? Colors.white : AppColor().primary.withOpacity(0.2),
          ),
          onPressed: () {},
          child:
              text == 'All'
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: appText(size: 15, weight: FontWeight.w600),
                      ),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: AppColor().rating, size: 16),
                      Text(
                        text,
                        style: appText(size: 15, weight: FontWeight.w600),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
