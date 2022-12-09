import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pura_new/Pages/Admin/dashboad.dart';
import 'package:pura_new/commonPage/login.dart';
import 'package:pura_new/component/logo.dart';
import 'package:pura_new/constants/socket.dart';
import 'package:pura_new/model/user.dart';
import 'package:pura_new/widget/text.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // initializeSocket();
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(context),
            Shimmer(
                duration: const Duration(seconds: 3), //Default value
                interval: const Duration(
                    seconds: 1), //Default value: Duration(seconds: 0)
                color: Colors.black, //Default value
                colorOpacity: 0, //Default value
                enabled: true, //Default value
                direction: const ShimmerDirection.fromLTRB(),
                child: textWidget('PURA', '70', FontWeight.w700, white)),
            textWidget(
                'SOCIAL JUSTICE MOVEMENT', '14', FontWeight.w600, Colors.grey)
          ],
        ),
      ),
    );
  }
}
