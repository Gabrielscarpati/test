import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/infoPrestadorDeServico/views/viewInfoVerifyIdetityDados.dart';
import '../../../../util/libraryComponents/colors/colors.dart';
import '../../../businessModel/businessModelVerifyIdentity.dart';

class ViewInfoVerifyIdentityBody extends StatelessWidget {
  ViewInfoVerifyIdentityBody({
    Key? key,
    required this.prestador,
  });

  final BusinessModelVerifyIdentity prestador;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BackgroundColorGrey,
      child: Column(
        children: [
          ViewInfoVerifyIdentityDados(
           prestador: prestador ,
          ),
        ],
      ),
    );
  }
}
