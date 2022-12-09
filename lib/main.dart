import 'package:flutter/material.dart';
import 'package:pura_new/Pages/Admin/dashboad.dart';
import 'package:pura_new/commonPage/login.dart';
import 'package:pura_new/commonPage/splash.dart';
import 'package:pura_new/constants/shared.dart';
import 'package:pura_new/constants/socket.dart';
import 'package:pura_new/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  initializeSocket();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIN = false;
  preffss() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? islogged = prefs.getBool('isLoggedIn');
    if (islogged != null) {
      setState(() {
        isLoggedIN = islogged;
      });
    }
  }

  @override
  void initState() {
    preffss();
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: isLoggedIN ? const AdminDashBoard() : const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
