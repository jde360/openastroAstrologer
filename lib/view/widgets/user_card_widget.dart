import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors/color_pallet.dart';
import '../../core/font/app_font.dart';
import 'space.dart';

class UserCardWidget extends StatelessWidget {
  final String name;
  final String image;
  final String id;
  const UserCardWidget(
      {super.key, required this.name, required this.id, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(10),
      // height: 200.h,
      width: 180.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor().primary.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48.w,
            backgroundColor: AppColor().primary.withOpacity(0.2),
            backgroundImage: NetworkImage(image),
          ),
          space(height: 18, width: 0),
          Text(
            name,
            style: appText(size: 15, weight: FontWeight.w500),
          ),
          space(height: 10, width: 0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor().secondary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
            child:
                Text('Chat', style: appText(size: 13, weight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
