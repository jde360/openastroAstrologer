import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/core/font/app_font.dart';

class ChatTileWidget extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imageUrl;
  final bool isOnline;
  const ChatTileWidget({
    super.key,
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SizedBox(
        height: 60,
        width: 60,
        child: Stack(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor().primary, width: 2),
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 18,
              child: Container(
                height: 15.h,
                width: 15.w,
                decoration: BoxDecoration(
                  color: isOnline ? AppColor().success : AppColor().error,
                  border: Border.all(color: AppColor().primary, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
      title: Text(name, style: appText(size: 15, weight: FontWeight.w600)),
      subtitle: Text(
        subtitle,
        style: appText(size: 11, weight: FontWeight.w400),
      ),
      trailing: Column(
        children: [
          Text(
            '10:30 AM',
            style: appText(
              size: 8,
              weight: FontWeight.w600,
            ).copyWith(color: AppColor().primary),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            height: 14,
            width: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor().primary,
            ),
            child: Text(
              '5',
              style: appText(
                size: 8,
                weight: FontWeight.w600,
              ).copyWith(color: AppColor().bg),
            ),
          ),
        ],
      ),
    );
  }
}
