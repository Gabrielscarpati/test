import 'package:flutter/cupertino.dart';//
import 'package:flutter/material.dart';//
import 'package:projeto_treinamento/framework/view.dart';//
import '../../../util/libraryComponents/colors/colorGradient.dart';//
import '../../../util/libraryComponents/colors/colors.dart';//
import 'viewActionsSelectCidade.dart';//
import 'viewModelSelectCidade.dart';//
import 'views/buttonGoSignUpScreenPart4.dart';//
import 'views/viewHeaderSelectCidade.dart';
import 'views/viewListaCidades.dart';

class ViewSelectCidade extends View<ViewModelSelectCidade, ViewActionsSelectCidade> {
  ViewSelectCidade({
    Key? key,
    ViewModelSelectCidade? viewModel,
    required ViewActionsSelectCidade viewActions,
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
                  child: ViewHeaderSelectCidadea(viewModel: viewModel!, viewActions: viewActions,),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selecione as cidades que voce pretende trabalhar",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .fontSize),
                      ),
                      Text(
                        "Cidades selecionadas: ${viewModel!.cidadesSelecionadas.length} ",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .fontSize),
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(
                      viewModel!.cidadesSelecionadas.length, (int index) {
                    return Chip(
                      backgroundColor: Colors.white,
                      label: Text(viewModel!.cidadesSelecionadas[index].nome),
                    );
                  }),
                ),
              ),
              Flexible(
                flex: 6,
                child: ViewListSelectCity(
                    viewModel: viewModel!, viewAction: viewActions),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ButtonGoSignUpScreenPart4(viewActions: viewActions, viewModel: viewModel!,),
          ),
        ),
      );
    }
  }
}
