import 'package:projeto_treinamento/framework/businessModel.dart';

class BusinessModelDDD extends BusinessModel {
  final int ddd;
  final String uf;

  BusinessModelDDD({
    required this.ddd,
    required this.uf,
  }) : super(id: ddd.toString());

  factory BusinessModelDDD.vazio() => BusinessModelDDD(ddd: 0, uf: '');
}
