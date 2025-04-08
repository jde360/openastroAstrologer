import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors/color_pallet.dart';
import '../../core/font/app_font.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final Function onClicked;
  final bool isLoading;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onClicked,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 192.w,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColor().bg),
          backgroundColor: WidgetStatePropertyAll(AppColor().textColor),
          textStyle: WidgetStatePropertyAll<TextStyle>(
            appText(size: 15, weight: FontWeight.w600),
          ),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.h)),
          ),
        ),
        onPressed: () {
          isLoading ? null : onClicked();
        },
        child:
            isLoading
                ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: AppColor().bg,
                    strokeWidth: 2,
                  ),
                )
                : Text(text),
      ),
    );
  }
}
