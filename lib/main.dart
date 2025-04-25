import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'core/theme/theme.dart';
import 'routes/app_route.dart';

import 'service/local_storage.dart';
import 'service/socket_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {
//   IO.Socket socket = SocketIOClient().appSocket;

//   final LocalStorage _localStorage = LocalStorage();
//   @override
//   void initState() {
//     Future.delayed(Duration.zero, () async {
//       SocketIOClient();
//       await _localStorage.init();
//       final token = await _localStorage.getToken();
//       if (token.isNotEmpty) {
//         log('astrologer connnected $token');
//         socket.emit('astrologerConnect', {'token': token});
//       }
//     });

//     super.initState();
//   }

class _MyAppState extends State<MyApp> {
  final LocalStorage _localStorage = LocalStorage();
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      SocketIOClient();
      socket = SocketIOClient().appSocket;

      await _localStorage.init();
      final token = await _localStorage.getToken();

      if (token.isNotEmpty) {
        log('astrologer connected $token');
        socket.emit('astrologerConnect', {'token': token});
      }
    });
  }

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
