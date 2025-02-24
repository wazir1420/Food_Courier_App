import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket socket;
  List<String> chatHistory = [];

  factory SocketService() {
    return _instance;
  }

  SocketService._internal() {
    socket = IO.io('http://192.168.100.4:1000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.onConnect((_) {
      debugPrint('Connected to server');
    });

    socket.onDisconnect((_) {
      debugPrint('Disconnected from server');
      Future.delayed(Duration(seconds: 5), () {
        socket.connect();
      });
    });

    socket.onError((error) {
      debugPrint('Error: $error');
      Future.delayed(Duration(seconds: 5), () {
        socket.connect();
      });
    });

    socket.connect();
  }

  void disconnect() {
    socket.disconnect();
  }

  bool isConnected() {
    return socket.connected;
  }

  void addMessage(String message) {
    chatHistory.add(message);
  }

  void clearListeners() {
    socket.off('message');
  }
}
