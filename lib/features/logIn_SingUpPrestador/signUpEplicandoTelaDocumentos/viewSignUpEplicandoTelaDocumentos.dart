
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUpPrestador/signUpEplicandoTelaDocumentos/views/bodySingUpScreenInstitution.dart';

class ViewsignUpEplicandoTelaDocumentos extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? workingHours;
  final String? description;
  final Future<String>? profilePicture;
  final List<dynamic>? comentarios;
  final List<dynamic>? cidades;
  final List<dynamic>? servicos;
  const ViewsignUpEplicandoTelaDocumentos({Key? key,
    required this.name,
    required this.phone,
    required this.workingHours,
    required this.description,
    required this.profilePicture,
    required this.comentarios,
    required this.cidades,
    required this.servicos, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyViewsignUpEplicandoTelaDocumentos(
        name: name,
        phone: phone,
        workingHours: workingHours,
        description:description,
        profilePicture: profilePicture,
        comentarios: comentarios,
        cidades: cidades,
        servicos: servicos,),

    );
  }
}
