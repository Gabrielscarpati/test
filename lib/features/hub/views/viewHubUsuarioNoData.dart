import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../logIn_SingUp/singUpPart1/signUpScreen.dart';


class ViewHubUsuarioNoData extends StatelessWidget {
  ViewHubUsuarioNoData({Key? key,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 24, right: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá,",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20)
              ),
              Text(
                  "Clique no botao ao\nlado para se cadastrar\ncomo profissional",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)
              ),
            ],
          ),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 180 * math.pi / 155,
                  child:Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    size: 30,
                  ),
                ),
                SizedBox(height: 65,),
              ],
            ),
          Column(
            children: [
              SizedBox(height: 12,),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUpPart1(),
                  ));
                },
                child:  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 1)],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black, //Image.asset('assets/images/lake.jpg')
                      backgroundImage: AssetImage("assets/Logo.jpeg"),
                      radius: 40.0, // Mudei de 30 para 36
                      child: Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
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
            'Donation Recipient',
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
    );*/


