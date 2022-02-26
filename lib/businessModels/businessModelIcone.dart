import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/framework/businessModel.dart';

class BusinessModelIcone extends BusinessModel {
  final IconData icone;

  BusinessModelIcone({
    required String id,
    required this.icone,
  }) : super(id: id);

  factory BusinessModelIcone.vazio() => BusinessModelIcone(
        id: "",
        icone: Icons.filter_none,
      );
}
