import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TocarPlanoPrestador{

  final int planoPrestadorEscolhido;


  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference getPlanoPrestador = FirebaseFirestore.instance.collection('dadosPrestador');

  Future<String?> getIdDoPrestador() async {
    final User? user = await auth.currentUser;
    final userId = user?.uid.toString();
    return userId;
  }


  Future<int> getTipoDePlano() async{
    DocumentSnapshot snapshot = await getPlanoPrestador.doc(await getIdDoPrestador()).get();
    var data = snapshot.data() as Map<String, dynamic>;
    var tipoPlanoPrestador = data['tipoPlanoPrestador'];
    return tipoPlanoPrestador;
  }

  Future<int> getDataDeVencimentoDoPlano() async{
    DocumentSnapshot snapshot = await getPlanoPrestador.doc(await getIdDoPrestador()).get();
    var data = snapshot.data() as Map<String, dynamic>;
    DateTime dataDeVencimento = data['dataVencimentoPlano'];
    return dataDeVencimento.second;
  }

  int getDataAtual(){
    return DateTime.now().second;
  }

  Future<num> getTempoRestante()async{
    num tempoRestante = getDataAtual() - await getDataDeVencimentoDoPlano();
    return tempoRestante;
  }

  Future<String> informarSePecisaDePagamento()async{
    if(await getTempoRestante() <2592000){
      return 'Voce ainda tem ${await getTempoRestante().toString()}de segundos, ainda nao e preciso para o plano ';
    }
    return 'receber plano';
  }


  Future<int> verificarPlano() async {
    if (planoPrestadorEscolhido == await getTipoDePlano()){
      //criar um alerta o seu plano ja e esse, ou que nao precisa de pagar novamente
      return 10;
    }
    return planoPrestadorEscolhido;
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateIdentidadePrestador() async {
    await firestore.collection('dadosPrestador').doc(await getIdDoPrestador()).update({
      'tipoPlanoPrestador': await verificarPlano(),
    });
  }


  TocarPlanoPrestador({required this.planoPrestadorEscolhido});
}