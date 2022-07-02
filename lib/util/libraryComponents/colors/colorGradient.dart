import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration BoxDecorationColorGradient(BuildContext context) {
  return BoxDecoration(
      gradient: LinearGradient(begin: Alignment.topCenter, colors: [
    Color.fromARGB(216, 224, 136, 41),
    Color.fromARGB(242, 224, 138, 47),
    Color.fromARGB(226, 216, 131, 41),
  ]));
}

List<Color> colorGradient = [
  Color.fromARGB(216, 224, 136, 41),
  Color.fromARGB(242, 224, 138, 47),
  Color.fromARGB(226, 216, 131, 41),
];
