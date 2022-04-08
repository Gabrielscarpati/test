import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubCidade.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubServicos.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubUsuario.dart';
import 'package:projeto_treinamento/util/libraryComponents/colors/colorGradient.dart';

import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class ViewHubBody extends StatelessWidget {
  ViewHubBody({
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelHub viewModel;
  final ViewActionsHub viewActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecorationColorGradient(context),
      
      child: Column(

        children: [
          ViewHubUsuario(viewModel: viewModel, viewActions: viewActions),

          Expanded(child:Container(
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),

            ),

            child:  Padding(
                padding: const EdgeInsets.all(12),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ViewHubCidade(viewModel: viewModel, viewActions: viewActions),
                    ViewHubServicos(viewModel: viewModel, viewActions: viewActions),
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
