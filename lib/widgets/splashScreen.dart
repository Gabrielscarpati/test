import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xfffa9a33),
      child: Center(
        child: Image(
          image: AssetImage('assets/splashscreenimage.png'),
        ),
      ),
    );
  }
}
