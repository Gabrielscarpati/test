import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUpPrestador/singUpPart5PrestadorDocumentos/views/bodySignUpPart5PrestadorDocumentos.dart';

class SignUpPart5PrestadorDocumentos extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? workingHours;
  final String? description;
  final Future<String>? profilePicture;
  final List<dynamic>? comentarios;
  final List<dynamic>? cidades;
  final List<dynamic>? servicos;

  const SignUpPart5PrestadorDocumentos({Key? key,
    required this.name,
    required this.phone,
    required this.workingHours,
    required this.description,
    required this.profilePicture,
    required this.comentarios,
    required this.cidades,
    required this.servicos,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodySignUpPart5PrestadorDocumentos(
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
