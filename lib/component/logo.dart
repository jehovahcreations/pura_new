import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget logo(BuildContext context) {
  return const Image(
    image: AssetImage("assets/logo.png"),
    fit: BoxFit.cover,
    height: 300.0,
    width: 300.0,
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

Widget loadingimg(BuildContext context) {
  return const Image(
    image: AssetImage("assets/loading.gif"),
    fit: BoxFit.fill,
  );
}
