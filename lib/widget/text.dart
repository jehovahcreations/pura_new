import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pura_new/constants/color.dart';

Widget textWidget(text, String size, weight, color) {
  return Text(
    text,
    style: TextStyle(
        fontSize: double.parse(size), fontWeight: weight, color: color),
  );
}
