import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/hub/presenterHub.dart';
import 'features/logIn_SingUp/veryFirstScreen/veryFirstScreenUserType.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: MaterialColor(
            0xffF0F0F0,
            <int, Color>{
              50: Color(0xFFE1F5FE),
              100: Color(0xFFB3E5FC),
              200: Color(0xFF81D4FA),
              300: Color(0xFF4FC3F7),
              400: Color(0xFF29B6F6),
              500: Color(0xffF0F0F0),
              600: Color(0xFF039BE5),
              700: Color(0xFF0288D1),
              800: Color(0xFF0277BD),
              900: Color(0xFF01579B),
            },
          ),
          brightness: Brightness.light,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            primary: Color(0xffF0F0F0), //change background color of button
            onPrimary: Theme.of(context).textTheme.headline4!.color, //change text color of button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          )),
        ),
        home: PresenterHub.presenter()
      //ViewVeryFirstScreen()

    );
  }
}
