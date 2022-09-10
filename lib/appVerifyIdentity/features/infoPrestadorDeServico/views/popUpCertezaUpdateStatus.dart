import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/appVerifyIdentity/ultil/updateWorkerStatus.dart';

import '../../listaPrestadoresDeServico/presenterListaVerifyIdentity.dart';

class PopUpCertezaUpdateStatus extends StatelessWidget {
  final String idPrestador;
  const PopUpCertezaUpdateStatus({Key? key, required this.idPrestador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpdateStatusWorker updateStatusWorker = UpdateStatusWorker(idPrestador: this.idPrestador);

    return AlertDialog(
      title: Text('Tem certeza que deseja\naprovar o prestador?',
        textAlign: TextAlign.center ,
        style: TextStyle(color: Colors.blue.shade500,
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ),
      actions: [
        TextButton(onPressed: () {
            updateStatusWorker.updateStatusWorker();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PresenterListaVerifyIdentity.presenter(),
            ));
        },
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade500,
                    Colors.blue.shade400
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 350.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                'Confirmar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        },
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade500,
                    Colors.blue.shade400
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 350.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                'Cancelar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
