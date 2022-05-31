import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelUsuario.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewActionsPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/viewModelPerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/perfilPrestadorDeServico/views/changePerfilPrestadorDeServico.dart';
import 'package:projeto_treinamento/widgets/customDropdownButtonEditor.dart';
import 'package:projeto_treinamento/widgets/customTextEditor.dart';

import '../../../util/libraryComponents/colors/colors.dart';

class HeaderPerfilPrestadorDeServico extends StatelessWidget {
  HeaderPerfilPrestadorDeServico(
  {Key? key, required this.viewModel, required this.viewActions, required});

final ViewModelPerfilPrestadorDeServico viewModel;
final ViewActionsPerfilPrestadorDeServico viewActions;


@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        color: BackgroundColorGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ChangePerfilPrestadorDeServico(
                                viewActions: viewActions,
                                viewModel: viewModel,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

}
