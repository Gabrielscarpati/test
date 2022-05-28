import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';

class ViewModelInfoUsuario extends ViewModel {
  final BusinessModelUsuario usuario;
  final BusinessModelCidade cidade;
  final Uint8List? imagemAtualizada;
  final Future<List<BusinessModelCidade>> listaCompletaCidade;

  final BusinessModelUsuario email;
  final BusinessModelUsuario phone;
  final BusinessModelUsuario description;
  final BusinessModelUsuario roles;
  final BusinessModelUsuario workingHours;
  final BusinessModelUsuario brazilianID;
  final BusinessModelUsuario brazilianIDpicture;

  ViewModelInfoUsuario({
    required this.usuario,
    required this.cidade,
    required this.listaCompletaCidade,
    this.imagemAtualizada,
    required this.email,
    required this.phone,
    required this.description,
    required this.roles,
    required this.workingHours,
    required this.brazilianID,
    required this.brazilianIDpicture,


  }) : super();
}
