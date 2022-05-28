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


  ViewModelInfoUsuario({
    required this.usuario,
    required this.cidade,
    required this.listaCompletaCidade,
    this.imagemAtualizada,
  }) : super();
}
