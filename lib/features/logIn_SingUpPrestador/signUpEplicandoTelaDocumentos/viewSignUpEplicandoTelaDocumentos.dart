
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUpPrestador/signUpEplicandoTelaDocumentos/views/bodySingUpScreenInstitution.dart';

class ViewsignUpEplicandoTelaDocumentos extends StatefulWidget {
  const ViewsignUpEplicandoTelaDocumentos({Key? key}) : super(key: key);

  @override
  _ViewHomeScreenState createState() => _ViewHomeScreenState();
}

class _ViewHomeScreenState extends State<ViewsignUpEplicandoTelaDocumentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyViewsignUpEplicandoTelaDocumentos(),

    );
  }
}
