import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_treinamento/framework/businessModel.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

class BusinessModelTiposDeServico extends BusinessModel with MixInDescricao {
  final int codTipoServico;
  final String descricao;
  final IconData icone;
  final int qtdePrestadoresDeServico;

  BusinessModelTiposDeServico({
    required this.codTipoServico,
    required this.descricao,
    required this.icone,
    required this.qtdePrestadoresDeServico,
  }) : super(id: codTipoServico.toString());

  factory BusinessModelTiposDeServico.vazio() => BusinessModelTiposDeServico(
        codTipoServico: 0,
        descricao: "",
        icone: Icons.close,
        qtdePrestadoresDeServico: 0,
      );

  @override
  String getDescricao() {
    return descricao;
  }
}
