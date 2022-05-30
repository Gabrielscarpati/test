import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../businessModels/businessModelCidade.dart';
import '../../../businessModels/businessModelUsuario.dart';
import '../../../widgets/customDropdownButtonEditor.dart';
import 'customEditPrestadorInformation.dart';
import '../../../widgets/customTextEditor.dart';
import '../viewActionsPerfilPrestadorDeServico.dart';
import '../viewModelPerfilPrestadorDeServico.dart';

class ChangePerfilPrestadorDeServico extends StatelessWidget {
  const ChangePerfilPrestadorDeServico(
      {Key? key, required this.viewModel, required this.viewActions})
      : super(key: key);

  final ViewModelPerfilPrestadorDeServico viewModel;
  final ViewActionsPerfilPrestadorDeServico viewActions;

  @override
  Widget build(BuildContext context) {
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
                      /*   CustomTextEditor<BusinessModelUsuario>(
                        labelText: "Nome",
                        iconData: Icons.account_box,
                        item: this.viewModel.usuario,
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),*/
                      Divider(),
                      CustomEditPrestadorInformationNome(
                        labelText: "Nome",
                        iconData: Icons.account_box,
                        item: this.viewModel.prestadorInformation.nome,
                        hintText: 'Digite o seu Nome',
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationTelefone(
                        labelText: "numero",
                        iconData: Icons.phone,
                        item: this.viewModel.prestadorInformation.phone,
                        hintText: 'Digite o seu Numero',
                        onEditionComplete: (String novoNumero) {
                          this.viewActions.onChangeNumero(novoNumero, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationServicosPrestados(
                        labelText: "Servicos Prestados",
                        iconData: Icons.work,
                        item: this.viewModel.prestadorInformation.roles,
                        hintText: 'Digite aqui',
                        onEditionComplete: (String novosServicos) {
                          this.viewActions.onChangeServicosPrestados(novosServicos, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationHorasDeTrabaho(
                        labelText: "Horas que trabalha",
                        iconData: Icons.lock_clock,
                        item: this.viewModel.prestadorInformation.workingHours,
                        hintText: 'Digite aqui',
                        onEditionComplete: (String novasHoras) {
                          this.viewActions.onChangeHorasTrabalhadas(novasHoras, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationDescricao(
                        labelText: "Descricao",
                        iconData: Icons.description,
                        item: this.viewModel.prestadorInformation.description,
                        hintText: 'Faca uma descricao',
                        onEditionComplete: (String novaDescricao) {
                          this.viewActions.onChangeDescricao(novaDescricao, viewModel);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}