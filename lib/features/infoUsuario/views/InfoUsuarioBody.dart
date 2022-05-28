import 'package:flutter/cupertino.dart';
import 'package:projeto_treinamento/features/infoUsuario/views/headerInfoUsuario.dart';
import '../viewActionsInfoUsuario.dart';
import '../viewModelInfoUsuario.dart';

class InfoUsuarioBody extends StatelessWidget {
  const InfoUsuarioBody({Key? key, required this.viewModel, required this.viewActions}) : super(key: key);

  final ViewModelInfoUsuario viewModel;
  final ViewActionsInfoUsuario viewActions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderInfoUsuario(viewModel: viewModel, viewActions: viewActions),
        ],
      ),
    );
  }
}
