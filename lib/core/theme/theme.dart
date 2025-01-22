import 'package:flutter/material.dart';

import '../colors/color_pallet.dart';

ThemeData appTheme() => ThemeData(
      primaryColor: AppColor().primary,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColor().primary,
        onPrimary: AppColor().textColor,
        secondary: AppColor().secondary,
        onSecondary: AppColor().textColor,
        error: AppColor().error,
        onError: AppColor().textColor,
        surface: AppColor().bg,
        onSurface: AppColor().textColor,
      ),
    );
