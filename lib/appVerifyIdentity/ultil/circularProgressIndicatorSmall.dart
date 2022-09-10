import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CircularProgressIndicatorSmall extends StatelessWidget {
  const CircularProgressIndicatorSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        color: Colors.indigo,
      ),
    );
  }
}
