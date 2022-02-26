import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/viewModelInfoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/infoPrestadorDeServico/views/viewInfoPrestadorDeServicoDadosRating.dart';

import '../viewActionsInfoPrestadorDeServico.dart';

class ViewInfoPrestadorDeServicoDados extends StatelessWidget {
  ViewInfoPrestadorDeServicoDados({
    Key? key,
    required this.viewModel,
    required this.viewActions,
    required this.iconeCelular,
  });

  final ViewModelInfoPrestadorDeServico viewModel;
  final ViewActionsInfoPrestadorDeServico viewActions;
  final BusinessModelIcone iconeCelular;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              _infoDoPrestadorDeServico(context, Icons.location_on, this.viewModel.cidade.nome.toUpperCase()),
                              SizedBox(height: 4),
                              _infoDoPrestadorDeServico(context, Icons.phone, this.viewModel.prestadorDeServicos.telefone),
                              SizedBox(height: 4),
                              _infoDoPrestadorDeServico(context, Icons.account_box, this.viewModel.tiposDeServico.descricao.toUpperCase()),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Hero(
                                  tag: viewModel.prestadorDeServicos.codPrestadorServico,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    backgroundImage: NetworkImage(this.viewModel.prestadorDeServicos.urlFoto),
                                    radius: 30.0,
                                    child: Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ViewInfoPrestadorDeServicoDadosRating(
                              viewActions: this.viewActions,
                              viewModel: this.viewModel,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: _botoes(context),
        ),
      ],
    );
  }

  Widget _infoDoPrestadorDeServico(BuildContext context, IconData iconData, String texto) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Row(
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
      ),
    );
  }

  Widget _botoes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 140,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff9e9e9e)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  Text("Ligar", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          SizedBox(
            // Colors.greenAccent
            width: 140,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff006400)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(MdiIcons.whatsapp, color: Colors.white),
                  Text("Whatsapp", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 8,
                          right: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              direction: Axis.horizontal,
                              children: [
                                Column(children: [
                                  Row(children: [
                                    Icon(Icons.location_on),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      this.viewModel.cidade.nome.toUpperCase(),
                                      textAlign: TextAlign.justify,
                                      style: Theme.of(context).textTheme.caption,
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      this.viewModel.prestadorDeServicos.telefone,
                                      textAlign: TextAlign.justify,
                                      style: Theme.of(context).textTheme.caption,
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(children: [
                                    Icon(Icons.account_box),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      this.viewModel.tiposDeServico.descricao.toUpperCase(),
                                      textAlign: TextAlign.justify,
                                      style: Theme.of(context).textTheme.caption,
                                    ),
                                  ]),
                                ]),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ViewInfoPrestadorDeServicoDadosRating(
                                    viewActions: this.viewActions,
                                    viewModel: this.viewModel,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 140,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Color(0xff9e9e9e)),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ))),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.phone, color: Colors.white),
                                          Text("Ligar", style: TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    // Colors.greenAccent
                                    width: 140,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Color(0xff006400)),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ))),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(MdiIcons.whatsapp, color: Colors.white),
                                          Text("Whatsapp", style: TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
   */
}
