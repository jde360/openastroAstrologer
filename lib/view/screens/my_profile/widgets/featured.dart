import 'package:flutter/material.dart';

import '../../../../core/font/app_font.dart';
import '../../../../service/image_provider.dart';
import '../../../widgets/space.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Featured', style: appText(size: 18, weight: FontWeight.w600)),
        space(height: 5, width: 0),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 11,
            runSpacing: 11,
            children: [
              Container(
                child: AppImageProvider.asset(
                  asset: 'user3',
                  height: 195,
                  width: 195,
                ),
              ),
              Container(
                child: AppImageProvider.asset(
                  asset: 'user4',
                  height: 195,
                  width: 195,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
