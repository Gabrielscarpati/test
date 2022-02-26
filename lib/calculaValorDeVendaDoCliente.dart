
class CalculaValorDeVendaDoCliente {

  int calculaValorDeVenda(int codCliente) {
    if (codCliente%2==0) {
      return codCliente~/2;
    } else {
      return codCliente*2;
    }
  }

}