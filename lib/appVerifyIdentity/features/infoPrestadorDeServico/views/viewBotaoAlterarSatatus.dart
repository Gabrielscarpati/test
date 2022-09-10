import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/appVerifyIdentity/features/infoPrestadorDeServico/views/popUpCertezaUpdateStatus.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';

class ViewBotaoAlterarSatatus extends StatelessWidget {
  final String idPrestador;
  ViewBotaoAlterarSatatus({Key? key, required this.idPrestador}) : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Ink(
        decoration: BoxDecorationColorGradientButton(context),

        child: Container(
          width: 240,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            'Aprovar prestador',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      onPressed: () {
        popUpCertezaUpdateStatus(context,idPrestador);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Future popUpCertezaUpdateStatus(context, idPrestador) => showDialog(
    context: context,
    builder: (context) => PopUpCertezaUpdateStatus(idPrestador: idPrestador,),
  );
}
