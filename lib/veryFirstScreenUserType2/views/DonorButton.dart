import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/hub/presenterHub.dart';

class DonorButton extends StatefulWidget {
  const DonorButton({Key? key}) : super(key: key);

  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<DonorButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
       Navigator.of(context).push(MaterialPageRoute(
           builder: (context) => PresenterHub.presenter()
       ));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            'Donor',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}