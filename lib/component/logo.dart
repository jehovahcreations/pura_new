import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget logo(BuildContext context) {
  return const Image(
    image: AssetImage("assets/logo.png"),
    fit: BoxFit.cover,
    height: 200.0,
    width: 200.0,
  );
}

Widget innerLogo(BuildContext context) {
  return const Image(
    image: AssetImage("assets/logo.png"),
    fit: BoxFit.cover,
    height: 100.0,
    width: 100.0,
  );
}
