import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/theme/theme.dart';
import 'routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: appRoute,
          title: 'Open Astro Partner',
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          home: child,
        );
      },
    );
  }
}
