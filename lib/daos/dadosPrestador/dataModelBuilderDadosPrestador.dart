import 'package:projeto_treinamento/framework/dataModelBuilder.dart';
import 'dataModelDadosPrestador.dart';

class DataModelBuilderDadosPrestador
    extends DataModelBuilder<DataModelDadosPrestador> {
  @override
  DataModelDadosPrestador? createDataModel(Map<String, dynamic> json) {
    print(json['city']);
    return DataModelDadosPrestador(
      name: json["name"],
      phone: json["phone"],
      workingHours: json["workingHours"],
      description: json["description"],
      profilePicture: json["profilePicture"],
      city: List<String>.from(json['city']),
      roles: List<int>.from(json["roles"]),
      numeroDeCliquesNoLigarOuWhatsApp:
          json["numeroDeCliquesNoLigarOuWhatsApp"],
      dataVencimentoPlano: json["dataVencimentoPlano"].toDate(),
      dataAberturaConta: json["dataAberturaConta"].toDate(),
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
      "numeroDeCliquesNoLigarOuWhatsApp":
          dataModel.numeroDeCliquesNoLigarOuWhatsApp,
      "dataVencimentoPlano": dataModel.dataVencimentoPlano,
      "dataAberturaConta": dataModel.dataAberturaConta,
      "IdPrestador": dataModel.IdPrestador,
    };
  }
}
