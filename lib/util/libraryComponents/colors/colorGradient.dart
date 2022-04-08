import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  BoxDecoration BoxDecorationColorGradient(BuildContext context) {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade600,
              Colors.blue.shade400,
            ]
        )
    );
  }