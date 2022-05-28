import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../hub/presenterHub.dart';

class ButtonSaveInfoUsuario extends StatefulWidget {
  const ButtonSaveInfoUsuario({Key? key}) : super(key: key);

  @override
  _ButtonSaveInfoUsuarioState createState() => _ButtonSaveInfoUsuarioState();
}

class _ButtonSaveInfoUsuarioState extends State<ButtonSaveInfoUsuario> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          ElevatedButton(
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),

              child: Container(
                constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Salvar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PresenterHub.presenter()
              ));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
