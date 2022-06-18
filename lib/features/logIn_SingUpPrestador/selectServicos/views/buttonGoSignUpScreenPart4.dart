import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../signUpEplicandoTelaDocumentos/viewSignUpEplicandoTelaDocumentos.dart';
import '../../singUpPart5PrestadorDocumentos/signUpPart5PrestadorDocumentos.dart';
import '../viewActionsSelectServicos.dart';
import '../viewModelSelectServicos.dart';

class ButtonGoSignUpScreenSelectServicos extends StatelessWidget {
  final ViewActionsSelectServicos? viewActions;
  final ViewModelSelectServicos? viewModel;
  final String? name;
  final String? phone;
  final String? workingHours;
  final String? description;
  final Future<String>? profilePicture;
  final List<dynamic>? comentarios;
  final List<dynamic>? cidades;
  final List<dynamic>? servicos;
  const ButtonGoSignUpScreenSelectServicos({Key? key,
    required this.viewActions,
    required this.viewModel,
    required this.name,
    required this.phone,
    required this.workingHours,
    required this.description,
    required this.profilePicture,
    required this.comentarios,
    required this.cidades,
    required this.servicos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          ElevatedButton(
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),

              child: Container(
                constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  'Continuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onPressed: () {
              if(1<3){
                this.viewActions?.savarListaSelecionadaFirebase(viewModel!);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewsignUpEplicandoTelaDocumentos(
                      name: name, phone: phone, workingHours: workingHours, description: description,
                      profilePicture: profilePicture, comentarios: comentarios,
                      cidades: ['ciade', 'cidade'], servicos: ['servico1', 'servico2'],)));
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
