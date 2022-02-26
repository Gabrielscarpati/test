import 'package:projeto_treinamento/daos/prestadorDeServicos/dataModelBuilderPrestadorDeServicos.dart';
import 'package:projeto_treinamento/framework/daoWebApi.dart';

import 'dataModelPrestadorDeServicos.dart';

class DaoPrestadorDeServicos extends DaoWebApi<DataModelPrestadorDeServicos, DataModelBuilderPrestadorDeServicos> {
  DaoPrestadorDeServicos()
      : super(
          dataModelBuilder: DataModelBuilderPrestadorDeServicos(),
          server: "https://voadragons.com",
          model: "prestadorservico",
        );

/*
  static List<DataModelPrestadorDeServicos> _dados = List.empty(growable: true)
    ..add(DataModelPrestadorDeServicos(
      codigo: 10,
      nome: 'Joao',
      telefone: '1111-1111',
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    ))
    ..add(DataModelPrestadorDeServicos(
      codigo: 20,
      nome: 'Jose',
      telefone: '2222-2222',
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    ))
    ..add(DataModelPrestadorDeServicos(
      codigo: 30,
      nome: 'Pedro',
      telefone: '3333-3333',
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    ))
    ..add(DataModelPrestadorDeServicos(
      codigo: 40,
      nome: 'Maria',
      telefone: '4444-4444',
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    ))
    ..add(DataModelPrestadorDeServicos(
      codigo: 50,
      nome: 'Gabriel',
      telefone: '5555-5555',
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    ))
    ..add(DataModelPrestadorDeServicos(
      codigo: 60,
      nome: 'Caio',
      telefone: '6666-6666',
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    ))
    ..add(DataModelPrestadorDeServicos(
      codigo: 70,
      nome: 'Christian',
      telefone: '7777-7777',
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    ));
   */

/*
  List<int> getCodigosPrestadorDeServico() {
    List<int> listaCodigosDosPrestadoresDeServico = List.empty(growable: true);
    for (int posicao = 0; posicao < _dados.length; posicao++) {
      listaCodigosDosPrestadoresDeServico.add(_dados[posicao].codigo);
    }
    return listaCodigosDosPrestadoresDeServico;
  }

  int geraProximoCodigo() {
    int novoCodigo = (_dados.length > 0) ? _dados[_dados.length - 1].codigo : 0;
    novoCodigo += 10;
    return novoCodigo;
  }
   */
}
