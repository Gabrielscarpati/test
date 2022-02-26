import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/framework/dataModel.dart';

class DataModelIcone extends DataModel {
  final int codePoint;
  final String fontFamily;
  final String? fontPackage;

  DataModelIcone({
    required String id,
    required this.codePoint,
    required this.fontFamily,
    this.fontPackage,
  }) : super(id: id);

  factory DataModelIcone.fromIconData({
    required String id,
    required IconData iconData,
  }) =>
      DataModelIcone(
        id: id,
        codePoint: iconData.codePoint,
        fontFamily: iconData.fontFamily ?? "",
        fontPackage: iconData.fontPackage,
      );

  factory DataModelIcone.fromJson({
    required String id,
    required Map<String, dynamic> iconData,
  }) =>
      DataModelIcone(
        id: id,
        codePoint: iconData['codePoint'],
        fontFamily: iconData['fontFamily'] ?? "",
        fontPackage: iconData['fontPackage'],
      );
}
