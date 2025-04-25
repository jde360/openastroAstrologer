import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../core/values/urls.dart';
import 'app_logger_service.dart';

// class SocketIOClient {
//   late IO.Socket socket;
//   SocketIOClient() {
//     _initSocket();
//     AppLog.info(message: "Socket Status: ${socket.connected}");
//   }
//   void _initSocket() {
//     socket = IO.io(AppConstant().socketUrl, <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': false,
//     });
//     log('${socket.connected}');
//     socket.connected ? null : socket.connect();
//     socket.onConnect((_) async {
//       AppLog.debug(message: 'Connected to the socket server');
//     });
//     socket.onDisconnect((_) {
//       AppLog.warning(message: 'Disconnected from the socket server');
//     });
//   }

//   IO.Socket get appSocket => socket;
// }

class SocketIOClient {
  static final SocketIOClient _instance = SocketIOClient._internal();

  factory SocketIOClient() {
    return _instance;
  }

  late IO.Socket socket;

  SocketIOClient._internal() {
    _initSocket();
    AppLog.info(message: "Socket Status: ${socket.connected}");
  }

  void _initSocket() {
    socket = IO.io(AppConstant().socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    if (!socket.connected) {
      socket.connect();
    }

    socket.onConnect((_) {
      AppLog.debug(message: 'Connected to the socket server');
    });

    socket.onDisconnect((_) {
      AppLog.warning(message: 'Disconnected from the socket server');
    });
  }

  IO.Socket get appSocket => socket;
}
