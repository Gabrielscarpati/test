import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../framework/dao.dart';
import '../../framework/dataModel.dart';
import '../../util/resposta_processamento.dart';
import '../prestadorInformation/dataModePrestadorInformation.dart';
import '../prestadorInformation/dataModelBuilderPrestadorInformation.dart';

class GetListaServicosFirebase {

  Future<Object?> getListaServicosFirebase() async {

    CollectionReference servico =  await FirebaseFirestore.instance.collection('listaServices');
    DocumentSnapshot listaDeServicoFirebase = await servico.doc('1').get();
    var mapServices = listaDeServicoFirebase.data() as Map<String, dynamic>;
    List listaDeServico = mapServices['list'];
    return listaDeServico;
  }

}