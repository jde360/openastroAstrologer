import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_astro/core/font/app_font.dart';

import '../../core/colors/color_pallet.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function onClicked;

  const OutlineButton({
    super.key,
    required this.text,
    required this.onClicked,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.h),
        border: Border.all(
          color: AppColor().textColor.withValues(alpha: 0.5),
          width: 1.w,
        ),
      ),
      child:
          isLoading
              ? CircularProgressIndicator(color: AppColor().textColor)
              : Text(text, style: appText(size: 15, weight: FontWeight.w600)),
    );
  }
}
