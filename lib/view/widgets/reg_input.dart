import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:open_astro/view/widgets/space.dart';

class RegInput extends StatelessWidget {
  final String name;
  final String hint;
  final TextEditingController controller;
  final bool isNum;
  final bool? isDesc;
  final int length;
  const RegInput({
    super.key,
    required this.name,
    this.isDesc,
    required this.controller,
    required this.isNum,
    required this.length,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: appText(size: 16, weight: FontWeight.w400)),
        space(height: 12, width: 0),
        SizedBox(
          height: isDesc == null ? 50.h : null,
          width: double.infinity,
          child: TextField(
            maxLines: isDesc == null ? 1 : 3,
            inputFormatters: [LengthLimitingTextInputFormatter(length)],
            controller: controller,
            keyboardType: isNum ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              hintText: hint,
              hintStyle: appText(
                size: 10,
                weight: FontWeight.w400,
              ).copyWith(color: AppColor().primary.withOpacity(0.3)),
              filled: true,
              fillColor: AppColor().primary.withValues(alpha: 0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
