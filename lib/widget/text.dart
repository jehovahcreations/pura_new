import 'package:flutter/material.dart';

Widget textWidget(text, String size, weight, color) {
  return Text(
    text,
    overflow: TextOverflow.fade,
    maxLines: 1,
    softWrap: false,
    style: TextStyle(
        fontSize: double.parse(size), fontWeight: weight, color: color),
  );
}
