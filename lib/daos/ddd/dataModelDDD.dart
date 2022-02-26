import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelDDD extends DataModel {
  final int ddd;
  final String uf;

  DataModelDDD({
    required this.ddd,
    required this.uf,
  }) : super(id: ddd.toString());
}
