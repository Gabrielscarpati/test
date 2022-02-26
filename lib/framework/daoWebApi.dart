import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_treinamento/framework/dataModelBuilder.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import 'dao.dart';
import 'dataModel.dart';

abstract class DaoWebApi<DM extends DataModel, DB extends DataModelBuilder<DM>> extends Dao<DM> {
  final String server;
  final String model;
  final DB dataModelBuilder;
  final Map<String, DM>? cache;

  DaoWebApi({required this.server, required this.model, required this.dataModelBuilder, this.cache});

  // server: https://voadragons.com
  // model: "usuario"

  // [server]/static/[model]/index.html
  String get staticPath => server + "/static/" + model;

  // [server]/api/[model]/index.php
  String get apiPath => server + "/api/" + model;

  Future<DM?> getDataModel(String id) async {
    try {
      DM? dataModel = _getDataModelFromCache(id);
      if (dataModel != null) return dataModel;
      String url = staticPath + "/" + id;
      // print(url);
      print(Uri.parse(url));
      http.Response response = await http.get(Uri.parse(url));
      // print("  --> " + response.body);
      if (response.statusCode == 200) {
        String jsonString = response.body;
        Map<String, dynamic> json = jsonDecode(jsonString);
        dataModel = await dataModelBuilder.createDataModel(json);
        _putDataModelIntoCache(id, dataModel);
        return dataModel;
      } else {
        throw Exception('Failed to open $url');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<DM>> getDataModels() async {
    String url = staticPath;
    //print(url);
    print(Uri.parse(url));
    http.Response response = await http.get(Uri.parse(url));
    // print("  --> " + response.body);
    if (response.statusCode == 200) {
      String jsonString = response.body;
      List<dynamic> json = jsonDecode(jsonString);
      List<DM> dataModels = List.empty(growable: true);
      json.forEach((element) {
        DM? dataModel = dataModelBuilder.createDataModel(element);
        if (dataModel != null) dataModels.add(dataModel);
      });
      return dataModels;
    } else {
      throw Exception('Failed to open $url');
    }
  }

  Future<List<DM>> getDataModelsById(String id) async {
    String url = staticPath + "/" + id;
    //print(url);
    print(Uri.parse(url));
    http.Response response = await http.get(Uri.parse(url));
    // print("  --> " + response.body);
    if (response.statusCode == 200) {
      String jsonString = response.body;
      List<dynamic> json = jsonDecode(jsonString);
      List<DM> dataModels = List.empty(growable: true);
      json.forEach((element) {
        DM? dataModel = dataModelBuilder.createDataModel(element);
        if (dataModel != null) dataModels.add(dataModel);
      });
      return dataModels;
    } else {
      throw Exception('Failed to open $url');
    }
  }

  Future<RespostaProcessamento> saveDataModel(DM dataModel) async {
    String url = apiPath;
    //print(url);
    print(Uri.parse(url));
    http.Response response = await http.post(Uri.parse(url), body: dataModelBuilder.createJson(dataModel));
    // print("  --> " + response.body);
    if (response.statusCode == 200) {
      return RespostaProcessamento.ok();
    } else {
      throw Exception('Failed to open $url');
    }
  }

  Future<RespostaProcessamento> removeDataModel(DM dataModel) async {
    String url = apiPath;
    //print(url);
    print(Uri.parse(url));
    http.Response response = await http.delete(Uri.parse(url), body: dataModelBuilder.createJson(dataModel));
    // print("  --> " + response.body);
    if (response.statusCode == 200) {
      return RespostaProcessamento.ok();
    } else {
      throw Exception('Failed to open $url');
    }
  }

  DM? _getDataModelFromCache(String id) {
    if ((this.cache != null) && (this.cache!.containsKey(id))) {
      return this.cache![id]!;
    }
    return null;
  }

  void _putDataModelIntoCache(String id, DM? dataModel) {
    if (dataModel != null) {
      if (this.cache != null) {
        this.cache!.putIfAbsent(id, () => dataModel);
      }
    }
  }
}
