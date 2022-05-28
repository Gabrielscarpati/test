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
                      _informacaoSobreCidade(
                          context, this.viewModel, this.viewActions),

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
                        item: this.viewModel.usuario.nome,
                        hintText: 'Digite o seu Nome',
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationTelefone(
                        labelText: "numero",
                        iconData: Icons.phone,
                        item: this.viewModel.usuario.phone,
                        hintText: 'Digite o seu Numero',
                        onEditionComplete: (String novoNome) {
                          //  this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationServicosPrestados(
                        labelText: "Servicos Prestados",
                        iconData: Icons.work,
                        item: this.viewModel.usuario.roles,
                        hintText: 'Digite aqui',
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationHorasDeTrabaho(
                        labelText: "Horas que voce trabalha",
                        iconData: Icons.lock_clock,
                        item: this.viewModel.usuario.workingHours,
                        hintText: 'Digite aqui',
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
                        },
                      ),
                      Divider(),
                      CustomEditPrestadorInformationDescricao(
                        labelText: "Descricao",
                        iconData: Icons.description,
                        item: this.viewModel.usuario.description,
                        hintText: 'Faca uma descricao',
                        onEditionComplete: (String novoNome) {
                          this.viewActions.onChangeName(novoNome, viewModel);
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

Widget _informacaoSobreCidade(
    BuildContext context,
    ViewModelPerfilPrestadorDeServico viewModel,
    ViewActionsPerfilPrestadorDeServico viewActions) {
  List<BusinessModelCidade> _listaInicialDeCidades = List.empty(growable: true);
  return FutureBuilder<List<BusinessModelCidade>>(
      future: viewModel.listaCompletaCidade,
      initialData: _listaInicialDeCidades,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length > 0) {
            return CustomDropdownButtonEditor<BusinessModelCidade>(
              iconData: Icons.location_on,
              labelText: "Cidade",
              items: snapshot.data!,
              selectedIndex: snapshot.data!.indexWhere(
                  (cidade) => cidade.codCidade == viewModel.cidade.codCidade),
              onEditionComplete: (BusinessModelCidade novaCidade) {
                viewActions.onChangeCidade(novaCidade, viewModel);
              },
            );
          } else {
            return (CupertinoActivityIndicator());
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}
