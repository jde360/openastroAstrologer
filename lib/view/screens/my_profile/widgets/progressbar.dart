import 'package:flutter/material.dart';

import '../../../../core/colors/color_pallet.dart';
import '../../../../core/font/app_font.dart';
import '../../../widgets/space.dart';

class ProgressbarWidget extends StatelessWidget {
  final double value;
  final String rating;
  const ProgressbarWidget({
    super.key,
    required this.value,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: AppColor().rating, size: 16),
        space(height: 0, width: 2),
        Text(
          rating,
          style: appText(
            size: 15,
            weight: FontWeight.w500,
            color: AppColor().rating,
          ),
        ),
        space(height: 0, width: 12),

        SizedBox(
          width: 118,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(8.0),
            backgroundColor: AppColor().primary.withValues(alpha: 0.2),

            valueColor: AlwaysStoppedAnimation<Color>(AppColor().rating),
            value: value,
          ),
        ),
      ],
    );
  }
}
