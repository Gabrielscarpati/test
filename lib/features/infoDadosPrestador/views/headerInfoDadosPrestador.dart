import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/viewModelInfoDadosPrestador.dart';
import 'package:projeto_treinamento/features/infoDadosPrestador/views/changeInfoDadosPrestador.dart';
import 'package:projeto_treinamento/widgets/customDropdownButtonEditor.dart';
import 'package:projeto_treinamento/widgets/customTextEditor.dart';
import '../../../util/libraryComponents/colors/colors.dart';
import '../viewActionsInfoDadosPrestador.dart';

class HeaderInfoDadosPrestador extends StatelessWidget {
  HeaderInfoDadosPrestador({Key? key, required this.viewModel, required this.viewActions, required});

  final ViewModelInfoDadosPrestador viewModel;
  final ViewActionsInfoDadosPrestador viewActions;

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
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: _renderizarAvatar(context, viewModel, viewActions),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ChangeInfoDadosPrestador(viewActions: viewActions, viewModel: viewModel,),
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

Widget _renderizarAvatar(BuildContext context, ViewModelInfoDadosPrestador viewModel, ViewActionsInfoDadosPrestador viewActions) {
  if (viewModel.imagemAtualizada == null) {
    return Hero(
      tag: viewModel.prestador.id,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        backgroundImage: NetworkImage(viewModel.prestador.profilePicture),
        radius: 70.0,
        child: Padding(
          padding: EdgeInsets.only(
            left: 88,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: new BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: IconButton(
                  onPressed: () {
                    viewActions.abrirInterfaceGaleriaCamera(ImageSource.camera, viewModel, viewModel.prestador);
                  },
                  color: Colors.white70,
                  icon: Icon(MdiIcons.camera),
                ),
              ),
              Container(
                decoration: new BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: IconButton(
                  onPressed: () {
                    viewActions.abrirInterfaceGaleriaCamera(ImageSource.gallery, viewModel, viewModel.prestador);
                  },
                  color: Colors.white70,
                  icon: Icon(MdiIcons.pen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    return Hero(
      tag: viewModel.prestador.id,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        backgroundImage: MemoryImage(viewModel.imagemAtualizada!),
        radius: 88.0,
        child: Padding(
          padding: EdgeInsets.only(
            left: 88,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: new BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: IconButton(
                  onPressed: () {
                    viewActions.abrirInterfaceGaleriaCamera(ImageSource.camera, viewModel, viewModel.prestador);
                  },
                  color: Colors.white,
                  icon: Icon(
                    MdiIcons.camera,
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: IconButton(
                  onPressed: () {
                    viewActions.abrirInterfaceGaleriaCamera(ImageSource.gallery, viewModel, viewModel.prestador);
                  },
                  color: Colors.white,
                  icon: Icon(MdiIcons.pen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _infoDoPrestadorDeServico(BuildContext context, IconData iconData, String texto) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(iconData),
      SizedBox(
        width: 8,
      ),
      Text(
        texto,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.caption,
      ),
    ],
  );
}
