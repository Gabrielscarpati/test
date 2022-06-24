import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetPrestadorInformationCompleta {
  String name;
  String phone;
  String workingHours;
  String description;
  String profilePicture;
  List<dynamic> comentarios;
  List<String> cidades;
  List<int> servicos;
  int numeroDeCliquesNoLigarOuWhatsApp;
  DateTime dataVencimentoPlano;
  DateTime dataAberturaConta;
  String brazilianIDPicture;
  int planoPrestador;

  SetPrestadorInformationCompleta({
    required this.name,
    required this.phone,
    required this.workingHours,
    required this.description,
    required this.profilePicture,
    required this.comentarios,
    required this.cidades,
    required this.servicos,
    required this.numeroDeCliquesNoLigarOuWhatsApp,
    required this.dataVencimentoPlano,
    required this.dataAberturaConta,
    required this.brazilianIDPicture,
    required this.planoPrestador,
  });
}

class UpdateCidadePrestador {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final List<String> cidades;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateCidadePrestador() async {
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'city': cidades,
    });
  }

  UpdateCidadePrestador({required this.cidades}) {
    this.cidades;
  }
}

class UpdateServicoPrestador {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final List<int> servicos;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateServicosPrestador() async {
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'roles': servicos,
    });
  }

  UpdateServicoPrestador({required this.servicos}) {
    this.servicos;
  }
}

class UpdateIdentidadePrestador {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserId() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final String identidade;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateIdentidadePrestador() async {
    await firestore.collection('dadosPrestador').doc(await getUserId()).update({
      'brazilianIDPicture': identidade,
    });
  }

  UpdateIdentidadePrestador({required this.identidade}) {
    this.identidade;
  }
}

class UpdateComentarioAvaliacao {
  CollectionReference dadosPrestador = FirebaseFirestore.instance.collection('dadosPrestador');
  CollectionReference dadosUsuarios = FirebaseFirestore.instance.collection('usuarios');


  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getIdDoUsuario() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }

  final String dataDoComentario;
  final double nota;
  final String textoComentario;
  final String idPrestador;

  CollectionReference firestore = FirebaseFirestore.instance.collection('comentarios');

  Future<String> getEmailUsuario() async {
    DocumentSnapshot emailUsuario = await dadosUsuarios.doc(
        await getIdDoUsuario()).get();
    print(emailUsuario.get('email'));
    return emailUsuario.get('email');
  }

  updateComentarioAvaliacao() async {
    print('-' * 50);
    await firestore.add({
      'data': dataDoComentario,
      'nota': nota.toStringAsPrecision(1),
      'textoComentario': textoComentario,
      'emailUsuario': await getEmailUsuario(),
      'idPrestador': this.idPrestador,
      'idUsuario': await getIdDoUsuario(),
    });
  }

  UpdateComentarioAvaliacao( {
    required this.dataDoComentario,
    required this.nota,
    required this.textoComentario,
    required this.idPrestador,
  }) {
    this.dataDoComentario;
    this.nota;
    this.textoComentario;
    this.idPrestador;
  }
}
