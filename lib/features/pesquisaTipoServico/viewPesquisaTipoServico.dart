import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/viewActionsPesquisaTipoServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/viewModelPesquisaTipoServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/views/viewHeaderPesquisaTipoServico.dart';
import 'package:projeto_treinamento/features/pesquisaTipoServico/views/viewListaTipoServico.dart';
import 'package:projeto_treinamento/framework/view.dart';

import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../util/libraryComponents/colors/colors.dart';

class ViewPesquisaTipoServico extends View<ViewModelPesquisaTipoServico, ViewActionsPesquisaTipoServico> {
  ViewPesquisaTipoServico({
    Key? key,
    ViewModelPesquisaTipoServico? viewModel,
    required ViewActionsPesquisaTipoServico viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);

  }

  _buildBody(BuildContext context) {
    if (viewModel?.listaVisivel == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicatorPersonalizado()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text("Selecione o tipo de serviço",
          style: TextStyle(color: Colors.white),),
          backgroundColor: ColorAppBar,
          iconTheme: IconThemeData(
              color: Colors.white,size: 30
          ),
        ),
        body: Container(
          color: BackgroundColorGrey,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Card(
                   borderOnForeground: true,
                   child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ViewHeaderPesquisaTipoServico(viewModel: viewModel!, viewActions: viewActions),
                    ),
                  ),

                Flexible(
                  flex: 2,
                  child:

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:
                          Text(
                            "Selecione um tipo de serviço:", textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline3!.copyWith(
                                fontSize:
                                Theme.of(context).textTheme.bodyText2!.fontSize),
                          ),


                    ),
                  ),
                ),
                Flexible(
                    flex: 39,
                    child: ViewListaTipoServico(viewModel: viewModel!, viewActions: viewActions)
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}