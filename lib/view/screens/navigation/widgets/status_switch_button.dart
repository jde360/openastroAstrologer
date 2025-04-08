import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:open_astro/service/svg_provider.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';
import 'package:open_astro/view/widgets/space.dart';

class StatusSwitchButton extends StatelessWidget {
  final bool status;
  final Function onTap;
  final String iconName;
  const StatusSwitchButton(
      {super.key,
      required this.status,
      required this.onTap,
      required this.iconName});

  @override
  Widget build(BuildContext context) {
    return status
        ? InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              onTap();
            },
            child: Container(
              width: percentWidth(percent: 28),
              height: 55.h,
              padding: const EdgeInsets.only(left: 15, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor().primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ON',
                    style: appText(size: 15, weight: FontWeight.w500)
                        .copyWith(color: AppColor().bg),
                  ),
                  // space(height: 0, width: 18),
                  CircleAvatar(
                    backgroundColor: AppColor().bg,
                    child: SvgProvider.asset(
                        asset: iconName, color: AppColor().primary),
                  )
                ],
              ),
            ),
          )
        : InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              onTap();
            },
            child: Container(
              height: 55.h,
              padding: const EdgeInsets.only(left: 2, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor().primary.withOpacity(0.1),
                border: Border.all(color: AppColor().primary),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor().primary,
                    child: SvgProvider.asset(
                        asset: iconName, color: AppColor().bg),
                  ),
                  space(height: 0, width: 20),
                  Text(
                    'OFF',
                    style: appText(size: 15, weight: FontWeight.w500)
                        .copyWith(color: AppColor().textColor),
                  ),
                ],
              ),
            ),
          );
  }
}
