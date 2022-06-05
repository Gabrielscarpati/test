import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/hubPrestador/views/viewHubCidade.dart';
import 'package:projeto_treinamento/features/hubPrestador/views/viewHubGridView.dart';
import 'package:projeto_treinamento/features/hubPrestador/views/viewHubServicos.dart';
import 'package:projeto_treinamento/util/libraryComponents/colors/colorGradient.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../viewActionsHub.dart';
import '../viewHub.dart';
import '../viewModelHub.dart';

class ViewHubBodyPrestador extends StatelessWidget {
  ViewHubBodyPrestador({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHubPrestador viewModel;
  final ViewActionsHubPrestador viewActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecorationColorGradient(context),
      child: Column(
        children: [
          ViewHubPrestador(viewModel: viewModel, viewActions: viewActions),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ViewHubCidade(
                        viewModel: viewModel, viewActions: viewActions),
                    ViewHubGridView(
                        viewModel: viewModel, viewActions: viewActions),
                    ViewHubServicos(
                        viewModel: viewModel, viewActions: viewActions),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
