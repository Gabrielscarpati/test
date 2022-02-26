import 'package:projeto_treinamento/businessModels/businessModelPrestadorDeServicos.dart';
import 'package:projeto_treinamento/providers/DDD/providerDDD.dart';
import 'package:projeto_treinamento/providers/prestadorDeServico/providerPrestadorDeServicos.dart';
import 'package:projeto_treinamento/util/numeroDeTelefone.dart';
import 'package:projeto_treinamento/util/resposta_processamento.dart';

import 'viewModelCadastroPrestadorDeServico.dart';

class BlocCadastroPrestadorDeServico {
  RespostaProcessamento gravaCadastroPrestadorDeServico(ViewModelCadastroPrestadorDeServico viewModel) {
    RespostaProcessamento respostaProcessamento = _validaInformacoesDigitadasCorretamente(viewModel);
    if (respostaProcessamento.processamentoOK == false) return respostaProcessamento;

    BusinessModelPrestadorDeServicos businessModel = BusinessModelPrestadorDeServicos(
      codPrestadorServico: 0,
      nome: viewModel.nome.text,
      telefone: viewModel.telefone.text,
      urlFoto: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
      statusOnline: false,
      // tiposDeServico: [],
      nota: 0,
      totalDeAvaliacoes: 0,
      totalDeAvaliacoesNota1: 0,
      totalDeAvaliacoesNota2: 0,
      totalDeAvaliacoesNota3: 0,
      totalDeAvaliacoesNota4: 0,
      totalDeAvaliacoesNota5: 0,
    );
    ProviderPrestadorDeServicos providerPrestadorDeServicos = ProviderPrestadorDeServicos();
    providerPrestadorDeServicos.saveBusinessModel(businessModel);
    return RespostaProcessamento.ok();
  }

  ViewModelCadastroPrestadorDeServico getViewModel() {
    return ViewModelCadastroPrestadorDeServico();
  }

  RespostaProcessamento _validaInformacoesDigitadasCorretamente(ViewModelCadastroPrestadorDeServico viewModel) {
    RespostaProcessamento respostaValidaNome = _validaNome(viewModel.nome.text);
    if (respostaValidaNome.processamentoOK == false) return respostaValidaNome;

    RespostaProcessamento respostaValidaTelefone = _validaNumeroDeTelefone(viewModel.telefone.text);
    if (respostaValidaTelefone.processamentoOK == false) return respostaValidaTelefone;

    return RespostaProcessamento.ok();
  }

  RespostaProcessamento _validaNome(String nome) {
    if (nome.length >= 4) {
      return RespostaProcessamento.ok();
    } else {
      return RespostaProcessamento.erro("Nome inválido! O nome precisa ter 4 caracteres!");
    }
  }

  RespostaProcessamento _validaNumeroDeTelefone(String telefone) {
    List<int> listaDosDDD = ProviderDDD().getCodigosDDDs();

    NumeroDeTelefone numeroDeTelefone = NumeroDeTelefone.parse(telefone, listaDosDDD);
    if (numeroDeTelefone.ddd.isEmpty)
      return RespostaProcessamento.erro("Telefone inválido!");
    else
      return RespostaProcessamento.ok();
  }
}
