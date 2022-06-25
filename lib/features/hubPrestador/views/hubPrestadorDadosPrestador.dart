import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/features/hubPrestador/views/viewHubPrestadorInfoPrestador.dart';

import '../viewActionsHub.dart';
import '../viewModelHub.dart';

class HubPrestadorDadosPrestador extends StatelessWidget {
  final ViewModelHubPrestador viewModel;
  final ViewActionsHubPrestador viewActions;

  HubPrestadorDadosPrestador({Key? key,
    required this.viewModel,
    required this.viewActions,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return  Container(
                  child:  Column(
                      children: [
                        SizedBox(height: 50,),
                        Row(
                          children: [
                            SizedBox(width: 16,),
                            Text('Minha conta', style: TextStyle(color: Colors.blueAccent,

                            ),),
                          ],
                        ),
                        Divider(
                          thickness: .8,
                          color: Colors.blueAccent,
                        ),
                        Row(
                            children: [
                              SizedBox(width: 16,),
                              Icon(Icons.account_circle_rounded,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    //SizedBox(width: 10,),
                                    Text('Meu nome completo',
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),

                                    Text(viewModel.prestadorDeServicos.nome, ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        Divider(
                          thickness: .8,
                          color: Colors.blueAccent,
                        ),
                        Row(
                            children: [
                              SizedBox(width: 16,),
                              Icon(Icons.phone,),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                    //SizedBox(width: 10,),
                                Text('Meu Numero de telefone',
                                      style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                      ),
                                    ),
                                SizedBox(
                                  height: 4,
                                ),

                                Text(viewModel.prestadorDeServicos.telefone, ),
                               ],
                             ),
                           ),
                         ]
                        ),
                      Divider(
                    thickness: .8,
                    color: Colors.blueAccent,
                  ),
                        Row(
                            children: [
                              SizedBox(width: 16,),
                              Icon(Icons.lock_clock,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Em quais horas eu trabalho',
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),

                                    Text(viewModel.prestadorDeServicos.workingHours, ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        Divider(
                          thickness: .8,
                          color: Colors.blueAccent,
                        ),
                        Row(
                            children: [
                              SizedBox(width: 16,),
                              Icon(Icons.description,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text('A descricao do meus servicos',
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    ConstrainedBox(
                                        constraints:  BoxConstraints(
                                          maxHeight: 1000,
                                          maxWidth: _screenWidth*.72,
                                        ),
                                        child: Container(


                                          //VER PQ TA DANDO ERRO . . .. . .


                                          child:Text(viewModel.prestadorDeServicos.description,),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        Divider(
                          thickness: .8,
                          color: Colors.blueAccent,
                        ),
                        Row(
                            children: [
                              SizedBox(width: 16,),
                              Icon(Icons.location_on,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text('As cidades em que eu atendo',
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),

                                    Text(getListaDecidades(viewModel.prestadorDeServicos.cidades)),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        Divider(
                          thickness: .8,
                          color: Colors.blueAccent,
                        ),
                        Row(
                            children: [
                              SizedBox(width: 16,),
                              Icon(Icons.work,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Os trabalhos que eu presto',
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),

                                    Text(viewModel.prestador.roles.toString(), ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        Divider(
                          thickness: .8,
                          color: Colors.blueAccent,
                        ),
                        Row(
                            children: [
                              SizedBox(width: 16,),
                              Icon(Icons.star,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('O tipo do meu plano',
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),

                                    Text(getplanoPrestador(viewModel.prestadorDeServicos.tipoPlanoPrestador),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        Divider(
                          thickness: .8,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(height: 8,),
                        Text('Veja como os usuários verão o seu perfil',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 16,),

                    ElevatedButton(
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),

                        child: Container(
                          constraints: BoxConstraints(maxWidth: 240.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Ver Perfil ',
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
                       Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewHubPrestadorInfoPrestador(viewModel: viewModel, viewActions: viewActions,),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
  String getplanoPrestador(int tipoDeplano){
    if(tipoDeplano == 0) return 'Voce ainda esta no periodo gratuito';
    if(tipoDeplano == 1) return 'O seu plano e Premium';
    if(tipoDeplano == 2) return 'O plano e o normal';
    if(tipoDeplano == 3) return 'Voce nao esta aparecendo para os usuarios,\n contrate um dos plano o mais rapido\npossivel para conseguir servicos';
    return 'sssd';
  }

  String getListaDecidades(List listaDeCidades){
    if(listaDeCidades.length== 0) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 1) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 2) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 3) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 4) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 5) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 6) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 7) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 8) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 9) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 10) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 11) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 0) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 0) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 0) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 0) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 0) return 'Voce nao ainda nao adicionou nenhuma cidade';
    if(listaDeCidades.length== 0) return 'Voce nao ainda nao adicionou nenhuma cidade';
        return 'sssd';
  }


}

