import 'package:pura_new/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

String valv = '';
initializeSocket() async {
  socket = io(socketUrl, <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false,
  });
  socket.connect();
  socket.on('message', (data) {});
  final prefs = await SharedPreferences.getInstance();
  final bool? islogged = prefs.getBool('isLoggedIn');
  final String? userId = prefs.getString('_id');
  if (islogged == true) {
    socket.emit('conne', userId);
  }

  socket.emit('join', 'join');
}
