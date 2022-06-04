import 'package:projeto_treinamento/framework/dataModelBuilder.dart';
import 'dataModelDadosPrestador.dart';

class DataModelBuilderDadosPrestador extends DataModelBuilder<DataModelDadosPrestador> {
  @override
  DataModelDadosPrestador? createDataModel(Map<String, dynamic> json) {
    return DataModelDadosPrestador(
      name: json["name"],
      phone: json["phone"],
      workingHours: json["workingHours"],
      description: json["description"],
      profilePicture: json["profilePicture"],
      city: json['city'],
      roles: json["roles"],
      numeroDeCliquesNoLigarOuWhatsApp: int.parse(json["numeroDeCliquesNoLigarOuWhatsApp"]),
      dataVencimentoPlano: DateTime.parse(json["dataVencimentoPlano"],),
      dataAberturaConta: DateTime.parse(json["dataAberturaConta"],),
      IdPrestador: json["IdPrestador"],
    );
  }

  @override
  Map<String, dynamic>? createJson(DataModelDadosPrestador? dataModel) {
    if (dataModel == null) return null;
    return {
      "name": dataModel.name,
      "phone": dataModel.phone,
      "workingHours": dataModel.workingHours,
      "description": dataModel.description,
      "profilePicture": dataModel.profilePicture,
      "city": dataModel.city,
      "roles": dataModel.roles,
      "numeroDeCliquesNoLigarOuWhatsApp": dataModel.numeroDeCliquesNoLigarOuWhatsApp,
      "dataVencimentoPlano": dataModel.dataVencimentoPlano,
      "dataAberturaConta": dataModel.dataAberturaConta,
      "IdPrestador": dataModel.IdPrestador,
    };
  }
}
