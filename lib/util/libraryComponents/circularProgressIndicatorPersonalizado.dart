import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CircularProgressIndicatorPersonalizado extends StatelessWidget {
  const CircularProgressIndicatorPersonalizado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        color: Colors.indigo,
      ),
    );
  }
}
