import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../selectCidades/viewActionsSelectCidade.dart';
import '../../selectCidades/viewModelSelectCidade.dart';
import '../../selectServicos/presenterSelectServicos.dart';
import '../../selectServicos/views/buttonGoSignUpScreenPart4.dart';

class ButtonGoSignUpScreenSelectCidade extends StatelessWidget {
    final ViewActionsSelectCidade? viewActions;
    final ViewModelSelectCidade? viewModel;
    final String? name;
    final String? phone;
    final String? workingHours;
    final String? description;
    final Future<String>? profilePicture;
    final List<dynamic>? comentarios;
    final List<dynamic>? cidades;

  const ButtonGoSignUpScreenSelectCidade({Key? key,
    required this.viewActions,
    required this.viewModel,
    required this.name,
    required this.phone,
    required this.workingHours,
    required this.description,
    required this.profilePicture,
    required this.comentarios,
    required this.cidades, }) : super(key: key);

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
              this.viewActions?.savarListaSelecionadaFirebase(viewModel!);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ButtonGoSignUpScreenSelectServicos(
                    viewActions: null, viewModel: null, name: name, phone: phone,
                    workingHours: workingHours, description: description,
                    profilePicture: profilePicture, comentarios: comentarios, cidades: ['ciade', 'cidade'], servicos: ['servico1', 'servico2'],
                  )));
             Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PresenterSelectServicos.presenter()));
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
