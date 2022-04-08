import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArrowBackHeader extends StatelessWidget {
  final String pageTitle;
  final Function functionGoBack;

  const ArrowBackHeader({Key? key,
    required this.pageTitle,
    required this.functionGoBack
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 60,),
        Row(
          children: [
            TextButton.icon(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => functionGoBack()
                ));

              } ,
              icon:  Icon(Icons.arrow_back, color: Color(0xff4cf2c7), size: 30.0),
              label: Text(''),
            ),
            SizedBox(
              width: 150,
            ),
            Text(pageTitle),
          ],
        ),
        SizedBox(height: 60,),
      ],
    );
  }
}


/*
class ArrowBackHeader extends StatefulWidget {
  final String pageTitle;
  final Function functionGoBack;

  const ArrowBackHeader({Key? key,
    required this.pageTitle,
    required this.functionGoBack
  }) : super(key: key);

  @override
  _LogInButtonState createState() => _LogInButtonState();
}
 */