import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetAvaliacoesPrestador {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<BusinessModelAvaliacaoPrestadorDeServico>> action(
      String idPrestador) async {
    List<BusinessModelAvaliacaoPrestadorDeServico> listaComentarios = [];
    QuerySnapshot query = await _instance
        .collection('comentarios')
        .where('idPrestador', isEqualTo: idPrestador)
        .get();

    List docs = query.docs;
    docs.forEach((element) {
      listaComentarios.add(
        BusinessModelAvaliacaoPrestadorDeServico(
          codPrestadorDeServico: element['idPrestador'],
          comentario: element['textoComentario'],
          data: element['data'],
          nota: int.parse(element['nota']),
          idUsuario: element['idUsuario'],
          emailUsuario: element['emailUsuario'],
        ),
      );
    });
    return listaComentarios;
  }
}
