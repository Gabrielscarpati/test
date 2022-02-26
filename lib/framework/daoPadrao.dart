import 'daoMemoria.dart';
import 'dataModel.dart';

abstract class DaoPadrao<DM extends DataModel> extends DaoMemoria<DM> {
  DaoPadrao({required List<DM> dados}) : super(dados: dados);
}
