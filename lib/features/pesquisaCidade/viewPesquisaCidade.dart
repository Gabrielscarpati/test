import 'package:flutter/cupertino.dart';//
import 'package:flutter/material.dart';//
import 'package:projeto_treinamento/features/pesquisaCidade/views/viewListaPesquisaCidades.dart';
import 'package:projeto_treinamento/framework/view.dart';//
import '../../../util/libraryComponents/colors/colorGradient.dart';//
import '../../../util/libraryComponents/colors/colors.dart';//
import '../logIn_SingUpPrestador/selectCidades/views/viewListaCidades.dart';
import 'viewActionsPesquisaCidade.dart';//
import 'viewModelPesquisaCidade.dart';//
import 'views/viewHeaderPesquisaCidade.dart';

class ViewPesquisaCidade extends View<ViewModelPesquisaCidade, ViewActionsPesquisaCidade> {
  ViewPesquisaCidade({
    Key? key,
    ViewModelPesquisaCidade? viewModel,
    required ViewActionsPesquisaCidade viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            title: Text('Choose city'),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecorationColorGradient(context),
            )
        ),
        body: Container(
          color: BackgroundColorGrey,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Card(
                borderOnForeground: true,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flexible(
                      flex: 1,
                      child: ViewHeaderSelectCidadea(viewModel: viewModel!, viewActions: viewActions,)
                  ),
                ),
              ),

              Flexible(
                flex: 6,
                child: ViewListaPesquisaCidade(
                    viewModel: viewModel!, viewAction: viewActions),
              )
            ],
          ),
        ),
      );
    }
  }
}
