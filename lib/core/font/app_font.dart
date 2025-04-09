import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle appText({
  required int size,
  required FontWeight weight,
  Color? color,
}) => TextStyle(
  fontSize: size.sp,
  fontWeight: weight,
  fontFamily: 'Montserrat',
  color: color,
);
