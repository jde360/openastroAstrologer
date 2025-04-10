import 'package:flutter/material.dart';

import '../../../../core/colors/color_pallet.dart';
import '../../../../core/font/app_font.dart';

class SpecializationCard extends StatelessWidget {
  final String text;
  const SpecializationCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor().primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 55,
      width: 120,

      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: appText(size: 14, weight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
