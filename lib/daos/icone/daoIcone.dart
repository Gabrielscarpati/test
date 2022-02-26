import 'package:projeto_treinamento/daos/icone/dataModelIcone.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelBuilderIcone.dart';
import 'dataModelIcone.dart';

class DaoIcone extends DaoWebApi<DataModelIcone, DataModelBuilderIcone> {
  static Map<String, DataModelIcone> _cache = Map<String, DataModelIcone>();

  DaoIcone()
      : super(
          dataModelBuilder: DataModelBuilderIcone(),
          server: "https://voadragons.com",
          model: "icone",
          cache: _cache,
        );

/*
  static List<DataModelIcone> _dados = List.empty(growable: true)
    ..add(DataModelIcone.fromIconData(id: "whatsApp", iconData: MdiIcons.whatsapp))
    ..add(DataModelIcone.fromIconData(id: "statusOnline", iconData: MdiIcons.checkboxBlankCircle))
    ..add(DataModelIcone.fromIconData(id: "cidades", iconData: MdiIcons.city))
    ..add(DataModelIcone.fromIconData(id: "servicosGerais", iconData: Icons.handyman_outlined))
    ..add(DataModelIcone.fromIconData(id: "motoboy", iconData: Icons.motorcycle))
    ..add(DataModelIcone.fromIconData(id: "baba", iconData: Icons.baby_changing_station))
    ..add(DataModelIcone.fromIconData(id: "motorista", iconData: Icons.drive_eta))
    ..add(DataModelIcone.fromIconData(id: "eletricista", iconData: Icons.electrical_services))
    ..add(DataModelIcone.fromIconData(id: "pedreiro", iconData: Icons.hardware))
    ..add(DataModelIcone.fromIconData(id: "bombeiroEncanador", iconData: Icons.plumbing));
   */
}
