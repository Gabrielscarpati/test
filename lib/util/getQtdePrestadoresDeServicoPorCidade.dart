import 'package:cloud_firestore/cloud_firestore.dart';

class GetQtdePrestadoresDeServicoPorCidade {
  final String idCidade;
  GetQtdePrestadoresDeServicoPorCidade({required this.idCidade});

  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<int> numeroPrestadorPorCidade() async {
    QuerySnapshot query = await _instance
        .collection('dadosPrestador')
        .where('city', arrayContainsAny: [idCidade]).get();

    List docs = query.docs;
    if(docs.length == 0){
      return 0;
    }

    return docs.length;
  }
}
