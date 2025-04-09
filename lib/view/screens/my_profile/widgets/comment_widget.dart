import 'package:flutter/material.dart';

import '../../../../core/colors/color_pallet.dart';
import '../../../../core/font/app_font.dart';
import '../../../../service/image_provider.dart';
import '../../../ui_helper/ui_helper.dart';
import '../../../widgets/space.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Video', style: appText(size: 18, weight: FontWeight.w600)),
        commentCard(),
        commentCard(),
      ],
    );
  }

  Widget commentCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColor().primary.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              //profile image
              leading: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: AppImageProvider.asset(
                    asset: 'user1',
                    height: 53,
                    width: 53,
                  ),
                ),
              ),
              //name
              title: Text(
                'Sucharita Paul',
                style: appText(size: 17, weight: FontWeight.w600),
              ),
              subtitle: Text(
                'Nov, 22, 2024',
                style: appText(size: 12, weight: FontWeight.w400),
              ),

              trailing: SizedBox(
                width: percentWidth(percent: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: AppColor().rating, size: 16),
                    space(height: 0, width: 12),
                    Text(
                      '5',
                      style: appText(
                        size: 20,
                        weight: FontWeight.w500,
                        color: AppColor().rating,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Text(
              'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,Lorem Ipsum .',
              style: appText(size: 14, weight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
