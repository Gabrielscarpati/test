import 'package:cloud_firestore/cloud_firestore.dart';

class GetQtdePrestadoresDeServicoPorTipoSeervicoECidade {
  final String idCidade = '';
  final int idServico = 0;
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<int> action() async {
    print('----------------uu--------------');

    QuerySnapshot resp = await _instance
        .collection('dadosPrestador')
        .where('city', arrayContainsAny: [idCidade])
        .where('roles', arrayContains: idServico)
        .get();
    print('------------------------------');
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(resp.docs.length);
    return resp.docs.length;
  }
}
