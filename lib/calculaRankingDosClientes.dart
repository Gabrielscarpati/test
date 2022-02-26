import 'calculaValorDeVendaDoCliente.dart';
import 'cliente.dart';

class CalculaRankDosClientes {

  void calculaRanking(List<Cliente> clientes) {
    List<int> valorRankeadoDosClientes = buscaValorRankeadoDosClientes(clientes);
    aplicaRankingAosClientes(valorRankeadoDosClientes, clientes);
  }

  int _buscaValorRankeadoDoCliente(int codCliente) {
    CalculaValorDeVendaDoCliente calculaValorDeVendaDoCliente = CalculaValorDeVendaDoCliente();
    return calculaValorDeVendaDoCliente.calculaValorDeVenda(codCliente);
  }

  List<int> buscaValorRankeadoDosClientes(List<Cliente> clientes) {
    List<int> valorRankeadoDosClientes = new List.empty(growable: true);
    for (int i = 0; i < clientes.length; i++) {
      int valorRankeado = _buscaValorRankeadoDoCliente(clientes[i].codigo);
      valorRankeadoDosClientes.add(valorRankeado);
    }
    return valorRankeadoDosClientes;
  }

  void aplicaRankingAosClientes(List<int> valorRankeadoDosClientes, List<Cliente> clientes) {
    int ranking = 0;
    for (int i = 0; i < valorRankeadoDosClientes.length; i++) {
      List<int> posicoesMaiorValor = buscaPosicoesMaiorValor(valorRankeadoDosClientes);
      for (int j = 0; j < posicoesMaiorValor.length; j++) {
        int posicaoMaiorValor = posicoesMaiorValor[j];
        clientes[posicaoMaiorValor].ranking = ranking + 1;
        valorRankeadoDosClientes[posicaoMaiorValor] = -1;
      }
      ranking += posicoesMaiorValor.length;
    }
  }

  List<int> buscaPosicoesMaiorValor(List<int> valorDeVendaDosClientes) {
    List<int> resultado = List.empty(growable: true);
    int maiorValor = -1;
    for (int i = 0; i < valorDeVendaDosClientes.length; i++) {
      if (valorDeVendaDosClientes[i] > 0) {
        if (valorDeVendaDosClientes[i] == maiorValor) {
          resultado.add(i);
        } else if (valorDeVendaDosClientes[i] > maiorValor) {
          maiorValor = valorDeVendaDosClientes[i];
          resultado.clear();
          resultado.add(i);
        }
      }
    }
    return resultado;
  }
}
