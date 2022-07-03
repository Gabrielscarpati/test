import 'package:projeto_treinamento/businessModels/businessModelAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelDadosPrestador.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/businessModels/businessModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/businessModels/businessModelTiposDeServico.dart';
import 'package:projeto_treinamento/daos/prestadoresDeServicoPorCidadeTipoDeServico/daoPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/daos/prestadoresDeServicoPorCidadeTipoDeServico/dataModelPrestadoresDeServicoPorCidadeTipoDeServico.dart';
import 'package:projeto_treinamento/framework/providerDireto.dart';
import 'package:projeto_treinamento/providers/avaliacaoPrestadorDeServico/providerAvaliacaoPrestadorDeServico.dart';
import 'package:projeto_treinamento/providers/cidade/providerCidade.dart';
import 'package:projeto_treinamento/providers/dadosPrestador/providerDadosPrestador.dart';
import 'package:projeto_treinamento/providers/prestadorDeServico/providerPrestadorDeServicos.dart';
import 'package:projeto_treinamento/providers/tiposDeServico/providerTiposDeServico.dart';
import 'package:projeto_treinamento/util/getAvaliacoesPrestador.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import '../../framework/provider.dart';
import '../../util/prestador.dart';
import 'adapterPrestadoresDeServicoPorCidadeTipoDeServico.dart';


class ProviderPrestadoresDeServicoPorCidadeTipoDeServico
    extends Provider<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico> {
  @override
  Future<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico>
      getBusinessModel(String id) async {
    BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico retornoBusinemodel =
        BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico.vazio();
    List<String> ids = id.split("-");
    String codCidade = ids[0];
    String codTipoDeServico = ids[1];

    List<BusinessModelPrestadorDeServicos> prestadores = [];
    List<BusinessModelCidade> cidades =
        await ProviderCidade().getBusinessModels();
    BusinessModelTiposDeServico tipoDeServico =
        await ProviderTiposDeServico().getBusinessModel(codTipoDeServico);

    List<BusinessModelDadosPrestador> prestadoresDeServico =
        await ProvideDadosPrestador().getBusinessModels();

    prestadoresDeServico = prestadoresDeServico
        .where((e) => e.roles.contains(int.parse(codTipoDeServico)))
        .toList() as List<BusinessModelDadosPrestador>;
    prestadoresDeServico = prestadoresDeServico
        .where((e) => e.city.contains(cidades[int.parse(codCidade)].nome))
        .toList() as List<BusinessModelDadosPrestador>;

    //print(prestadoresDeServico);
    //print(cidades[int.parse(codCidade)].nome);

    for (int i = 0; i < prestadoresDeServico.length; i++) {
      BusinessModelDadosPrestador prestador = prestadoresDeServico[i];
      List<BusinessModelAvaliacaoPrestadorDeServico> comentarios =
          await GetAvaliacoesPrestador().action(prestador.IdPrestador);
      double nota = 0;
      int totalDeAvaliacoes = 0;
      int totalDeAvaliacoesNota1 = 0;
      int totalDeAvaliacoesNota2 = 0;
      int totalDeAvaliacoesNota3 = 0;
      int totalDeAvaliacoesNota4 = 0;
      int totalDeAvaliacoesNota5 = 0;

      comentarios.forEach((coment) {
        if (coment.nota == 1) {
          totalDeAvaliacoesNota1++;
        }
        if (coment.nota == 2) {
          totalDeAvaliacoesNota2++;
        }
        if (coment.nota == 3) {
          totalDeAvaliacoesNota3++;
        }
        if (coment.nota == 4) {
          totalDeAvaliacoesNota4++;
        }
        if (coment.nota == 5) {
          totalDeAvaliacoesNota5++;
        }
        nota += coment.nota;
        totalDeAvaliacoes++;
      });

      if (totalDeAvaliacoes > 0) {
        nota = nota / totalDeAvaliacoes;
      } else {
        nota = 3;
      }

      prestadores.add(BusinessModelPrestadorDeServicos(
        codPrestadorServico: prestador.IdPrestador,
        nome: prestador.name,
        nota: nota,
        statusOnline: true,
        telefone: prestador.phone,
        totalDeAvaliacoes: totalDeAvaliacoes,
        totalDeAvaliacoesNota1: totalDeAvaliacoesNota1,
        totalDeAvaliacoesNota2: totalDeAvaliacoesNota2,
        totalDeAvaliacoesNota3: totalDeAvaliacoesNota3,
        totalDeAvaliacoesNota4: totalDeAvaliacoesNota4,
        totalDeAvaliacoesNota5: totalDeAvaliacoesNota5,
        urlFoto: prestador.profilePicture,
        description: prestador.description,
        tipoPlanoPrestador: prestador.tipoPlanoPrestador,
        cidades: prestador.city,
        servicos: prestador.roles,
        workingHours: prestador.workingHours,
        cliquesNoWhatsApp: prestador.numeroDeCliquesNoLigarOuWhatsApp,
        cliquesNoPerfil: prestador.cliquesNoPerfil
      ));
    }

    retornoBusinemodel =
        BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico(
      cidade: cidades[int.parse(codCidade)],
      prestadoresDeServico: prestadores,
      tipoDeServico: tipoDeServico,
    );

    return retornoBusinemodel;
  }

  Future getComentarios() async {
    List<BusinessModelDadosPrestador> prestadoresDeServico =
    await ProvideDadosPrestador().getBusinessModels();
    Prestador().listaTodosPrestadores;
    for (int i = 0; i < prestadoresDeServico.length; i++) {
      BusinessModelDadosPrestador prestador = prestadoresDeServico[i];
      List<BusinessModelAvaliacaoPrestadorDeServico> comentarios =
          await GetAvaliacoesPrestador().action(prestador.IdPrestador);
      if (comentarios.length > 0) {
        return comentarios;
      }
    }
  }

  @override
  Future<List<BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico>>
      getBusinessModels() {
    // TODO: implement getBusinessModels
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> removeBusinessModel(
      BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico businessModel) {
    // TODO: implement removeBusinessModel
    throw UnimplementedError();
  }

  @override
  Future<RespostaProcessamento> saveBusinessModel(
      BusinessModelPrestadoresDeServicoPorCidadeTipoDeServico businessModel) {
    // TODO: implement saveBusinessModel
    throw UnimplementedError();
  }
}
