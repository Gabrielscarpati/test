import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpPorFavorSelecioneUmaFoto extends StatelessWidget {
  const PopUpPorFavorSelecioneUmaFoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
          title: Text('Por favor selecione\numa foto!!!',
            textAlign: TextAlign.center ,
            style: TextStyle(color: Colors.blue.shade500,
                fontWeight: FontWeight.bold,
                fontSize: 28),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade900,
                        Colors.blue.shade500,
                        Colors.blue.shade400
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: 350.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Ok',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
