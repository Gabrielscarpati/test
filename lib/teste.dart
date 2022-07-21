import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



// To parse this JSON data, do
//
//     final dataMoldel = dataMoldelFromJson(jsonString);


class Teste extends StatelessWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dao datamodel = Dao(tableName: 'dadosPrestador');
    return Scaffold(
      body: Container(
        child: Text(datamodel.getDataModelFromFirebase().toString()),
      ),
    );
  }
}

class Dao{
  final String tableName;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> getUserId() async{
    return await _firebaseAuth.currentUser!.uid;
  }

  FirebaseFirestore? _instance;

  Future<Map?> getDataModelFromFirebase() async {

    _instance = FirebaseFirestore.instance;
    CollectionReference dadosPrestador = _instance!.collection(tableName);

    DocumentSnapshot json = await dadosPrestador.doc(await getUserId()).get();

    var createDataModel =  DataModelBuilder().createDataModel(json);
    createDataModel;
  }

  Dao({required this.tableName});
}


class DataModelBuilder{
  DataMoldel createDataModel(DocumentSnapshot<Object?> json){
    return DataMoldel(
      IdPrestador: json['IdPrestador'],
      name: json['name'],
      phone: json['phone'],
      workingHours: json['workingHours'],
      description: json['description'],
      profilePicture: json['profilePicture'],
      city: List<String>.from(json['city']),
      roles: List<int>.from(json['roles']),
      numeroDeCliquesNoLigarOuWhatsApp: json['numeroDeCliquesNoLigarOuWhatsApp'],
      dataVencimentoPlano: json['dataVencimentoPlano'].toDate(),
      dataAberturaConta: json['dataAberturaConta'].toDate(),
      tipoPlanoPrestador: json['tipoPlanoPrestador'],
      numeroDePessoasViramPerfilDessePrestador: json['numeroDePessoasViramPerfilDessePrestador'],
    );
  }

/*  Map<String, dynamic> toJson() => {
    "IdPrestador": IdPrestador,
    "name": name,
    "phone": phone,
    "workingHours": workingHours,
    "description": description,
    "profilePicture": profilePicture,
    "city": city,
    "roles": roles,
    "numeroDeCliquesNoLigarOuWhatsApp": numeroDeCliquesNoLigarOuWhatsApp,
    "dataVencimentoPlano": dataVencimentoPlano,
    "dataAberturaConta": dataAberturaConta,
    "tipoPlanoPrestador": tipoPlanoPrestador,
    "numeroDePessoasViramPerfilDessePrestador": numeroDePessoasViramPerfilDessePrestador,
  };*/
}


class DataMoldel {
  DataMoldel({
    required this.IdPrestador,
    required this.name,
    required this.phone,
    required this.workingHours,
    required this.description,
    required this.profilePicture,
    required this.city,
    required this.roles,
    required this.numeroDeCliquesNoLigarOuWhatsApp,
    required this.dataVencimentoPlano,
    required this.dataAberturaConta,
    required this.tipoPlanoPrestador,
    required this.numeroDePessoasViramPerfilDessePrestador,
  });

  String IdPrestador;
  String name;
  String phone;
  String workingHours;
  String description;
  String profilePicture;
  List<String> city;
  List<int> roles;
  int numeroDeCliquesNoLigarOuWhatsApp;
  DateTime dataVencimentoPlano;
  DateTime dataAberturaConta;
  int tipoPlanoPrestador;
  int numeroDePessoasViramPerfilDessePrestador;
}
