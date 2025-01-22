import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/core/font/app_font.dart';

class AppFilterChip extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final bool isSelected;
  const AppFilterChip(
      {super.key,
      required this.text,
      required this.onClick,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.only(right: 5, bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor().primary
              : AppColor().primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: appText(size: 10, weight: FontWeight.w500).copyWith(
              color: isSelected ? AppColor().bg : AppColor().textColor),
        ),
      ),
    );
  }
}
