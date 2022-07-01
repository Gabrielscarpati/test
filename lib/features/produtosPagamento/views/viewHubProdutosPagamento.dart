import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/daos/firebase/authService.dart';
import 'package:projeto_treinamento/features/hubUsuario/views/viewHubCidade.dart';
import 'package:projeto_treinamento/features/hubUsuario/views/viewHubGridView.dart';
import 'package:projeto_treinamento/features/hubUsuario/views/viewHubPrestador.dart';
import 'package:projeto_treinamento/features/hubUsuario/views/viewHubServicos.dart';
import 'package:projeto_treinamento/features/produtosPagamento/viewActionsProdutosPagamento.dart';
import 'package:projeto_treinamento/features/produtosPagamento/viewModelProdutosPagamento.dart';
import 'package:projeto_treinamento/util/libraryComponents/colors/colorGradient.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../../logIn_SingUpPrestador/veryFirstScreen/veryFirstScreenUserType.dart';

class ViewBodyProdutosPagamento extends StatelessWidget {
  ViewBodyProdutosPagamento({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelProdutosPagamento viewModel;
  final ViewActionsProdutosPagamento viewActions;

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecorationColorGradient(context),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.blue.shade900,
                      spreadRadius: 1)
                ],
                color: BackgroundColorGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 12, left: 12, top: 8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
