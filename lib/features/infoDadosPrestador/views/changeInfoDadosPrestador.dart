import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../businessModels/businessModelCidade.dart';
import '../../../daos/firebase/authService.dart';
import '../../../widgets/customDropdownButtonEditor.dart';
import 'customEditPrestadorInformation.dart';
import '../../../widgets/customTextEditor.dart';
import '../viewActionsInfoDadosPrestador.dart';
import '../viewModelInfoDadosPrestador.dart';

class ChangeInfoDadosPrestador extends StatelessWidget {
  const ChangeInfoDadosPrestador(
      {Key? key, required this.viewModel, required this.viewActions})
      : super(key: key);

  final ViewModelInfoDadosPrestador viewModel;
  final ViewActionsInfoDadosPrestador viewActions;

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomEditPrestadorInformationNome(
                        labelText: "Nome",
                        iconData: Icons.account_box,
                        item: this.viewModel.prestador.name,
                        hintText: 'Digite o seu Nome',
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationTelefone(
                        labelText: "numero",
                        iconData: Icons.phone,
                        item: this.viewModel.prestador.phone,
                        hintText: 'Digite o seu Numero',
                        onEditionComplete: (String novoTelefone) {
                          this
                              .viewActions
                              .onChangeNumber(novoTelefone, viewModel);
                        },
                      ),
                      Divider(),

                      /*CustomEditPrestadorInformationServicosPrestados(
                        labelText: "Servicos Prestados",
                        iconData: Icons.work,
                        item: this.viewModel.prestador.roles,
                        hintText: 'Digite aqui',
                        onEditionComplete: (String novoNome) {
                           // this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),
                      Divider(
                      ),*/

                      CustomEditPrestadorInformationHorasDeTrabaho(
                        labelText: "Horas que voce trabalha",
                        iconData: Icons.lock_clock,
                        item: this.viewModel.prestador.workingHours,
                        hintText: 'Digite aqui',
                        onEditionComplete: (String novoHorario) {
                          this
                              .viewActions
                              .onChangeHoras(novoHorario, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationDescricao(
                        labelText: "Descricao",
                        iconData: Icons.description,
                        item: this.viewModel.prestador.description,
                        hintText: 'Faca uma descricao',
                        onEditionComplete: (String novaDesc) {
                          this
                              .viewActions
                              .onChangeDescricao(novaDesc, viewModel);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade900,
                              Colors.blue.shade500,
                              Colors.blue.shade400
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Sair da conta',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onPressed: () {
                      authService.signOut();
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
            ),
          ],
        ),
      ),
    );
  }
}
