import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../veryFirstScreen/views/bodyVeryFirstSceen.dart';


class ViewVeryFirstScreen extends StatefulWidget {
  const ViewVeryFirstScreen({Key? key}) : super(key: key);

  @override
  _ViewHomeScreenState createState() => _ViewHomeScreenState();
}

class _ViewHomeScreenState extends State<ViewVeryFirstScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BodyVeryFirstScreen(),
    );
  }
}