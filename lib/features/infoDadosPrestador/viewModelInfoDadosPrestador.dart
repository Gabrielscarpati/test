import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';

class ViewModelInfoDadosPrestador extends ViewModel {
  final BusinessModelDadosPrestador prestador;
  final List<BusinessModelCidade> cidades;
  final Uint8List? imagemAtualizada;
  final Future<List<BusinessModelCidade>> listaCompletaCidade;


  ViewModelInfoDadosPrestador({
    required this.prestador,
    required this.cidades,
    required this.listaCompletaCidade,
    this.imagemAtualizada,
  }) : super();
}
