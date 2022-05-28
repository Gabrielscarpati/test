import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorInfomation.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrincipaisTiposDeServicoCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/framework/viewModel.dart';

class ViewModelPerfilPrestadorDeServico extends ViewModel {
  BusinessModelPrestadorInformation prestadorInformation;

  ViewModelPerfilPrestadorDeServico({required this.prestadorInformation})
      : super();
}
