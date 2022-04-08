import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/views/viewHeaderPesquisaTipoServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/views/viewListaTipoServico.dart';

import '../../../util/libraryComponents/colors/colorGradient.dart';
import '../viewActionsPesquisaTipoServico.dart';
import '../viewModelPesquisaTipoServico.dart';


class ViewPesquisaTipoServicoBody extends StatelessWidget {
  ViewPesquisaTipoServicoBody(
    BuildContext context, {
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelPesquisaTipoServico viewModel;
  final ViewActionsPesquisaTipoServico viewActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      //child: ArrowBackHeader(functionGoBack: ViewHubBody(), pageTitle:'dd' ),

      decoration: BoxDecorationColorGradient(context),

      child: Column(
        children: [
          SizedBox(height: 100,),
          Expanded(child:Container(
            decoration:  BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 15, color: Colors.blue.shade900, spreadRadius: 1)],
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),

            ),

            child:  Padding(
              padding: const EdgeInsets.all(12),
              child:
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ViewHeaderPesquisaTipoServico(viewModel: viewModel, viewActions: viewActions),
                  ),
                  ViewListaTipoServico(viewModel: viewModel, viewActions: viewActions),
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

/*
class ViewPesquisaCidadeBody extends StatelessWidget {
  ViewPesquisaCidadeBody(
    BuildContext context, {
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

  final ViewModelPesquisaCidade viewModel;
  final ViewActionsPesquisaCidade viewActions;

  @override
  Widget build(BuildContext context) {
    return Container(
        //child: ArrowBackHeader(functionGoBack: ViewHubBody(), pageTitle:'dd' ),

      decoration: BoxDecorationColorGradient(context),

      child: Column(
          children: [
            SizedBox(height: 100,),
              Expanded(child:Container(
                decoration:  BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 15, color: Colors.blue.shade900, spreadRadius: 1)],
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),

                ),

                child:  Padding(
                  padding: const EdgeInsets.all(12),
                  child:
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ViewHeaderPesquisaTipoServico(viewModel: viewModel, viewActions: viewActions),
                      ),
                       ViewListaTipoServico(viewModel: viewModel, viewActions: viewActions),
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



 */