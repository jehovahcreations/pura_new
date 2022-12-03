import 'package:flutter/material.dart';
import 'package:pura_new/constants/constant.dart';
import 'package:socket_io_client/socket_io_client.dart';

String valv = '';
initializeSocket() async {
  socket = io(socketUrl, <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false,
  });
  socket.connect();
  socket.on('message', (data) {});
  socket.emit('join', 'join');
}
