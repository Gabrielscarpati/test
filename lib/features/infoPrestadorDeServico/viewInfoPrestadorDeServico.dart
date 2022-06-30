import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoBody.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoHeader.dart';
import 'package:projeto_treinamento/framework/view.dart';

import '../../util/libraryComponents/circularProgressIndicatorPersonalizado.dart';
import '../../util/libraryComponents/colors/colors.dart';
import 'viewActionsInfoPrestadorDeServico.dart';
import 'viewModelInfoPrestadorDeServico.dart';

class ViewInfoPrestadorDeServico extends View<ViewModelInfoPrestadorDeServico, ViewActionsInfoPrestadorDeServico> {
  ViewInfoPrestadorDeServico({
    Key? key,
    ViewModelInfoPrestadorDeServico? viewModel,
    required ViewActionsInfoPrestadorDeServico viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        // automaticallyImplyLeading: false,
        title: viewModel == null
            ? CircularProgressIndicator()
            : ViewInfoPrestadorDeServicoHeader(
                viewActions: this.viewActions,
                viewModel: this.viewModel!,
              ),
        backgroundColor: ColorAppBar,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _buildBody(context),
    );
  }
  /*
  AppBar(title: Text("Selecione uma cidade",
        style: TextStyle(color: Colors.white),),
          backgroundColor: ColorAppBar,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ), */



  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicatorPersonalizado(),
      );
    } else {
      return Scaffold(
        /*
        appBar: AppBar(
          title: TitleInfoPrestadorDeServico(viewModel: this.viewModel!),
          actions: [ActionsInfoPrestadorDeServico(viewModel: this.viewModel!, viewActions: this.viewActions)],
        ),
         */
        body: ViewInfoPrestadorDeServicoBody(
          viewModel: this.viewModel!,
          viewActions: this.viewActions,
        ),
      );
    }
  }
}
