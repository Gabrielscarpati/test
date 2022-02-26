
class NumeroDeTelefone {
  final String ddd;
  final String prefixo;
  final String numero;

  NumeroDeTelefone({required this.ddd, required this.prefixo, required this.numero});

  static NumeroDeTelefone parse(String telefone, List<int> listaDosDDD) {
    if (_verificaSeStringPossuiSomenteNumeros(telefone) == false)
      return NumeroDeTelefone(ddd:'', prefixo: '', numero: '');
    if ((telefone.length < 10) || (telefone.length > 11))
      return NumeroDeTelefone(ddd:'', prefixo: '', numero: '');
    if (telefone.length == 10)
      return _validaNumeroDeTelefoneFixo(telefone, listaDosDDD);
    else
      return _validaNumeroDeTelefoneCelular(telefone, listaDosDDD);
  }

  static NumeroDeTelefone _validaNumeroDeTelefoneFixo(String telefone, List<int> listaDosDDD) {
    /// 2730620812
    List<String> telefoneLista = telefone.split('');
    String ddd = telefoneLista[0] + telefoneLista[1]; // "27"
    String prefixo = telefoneLista[2] + telefoneLista[3]  + telefoneLista[4]  + telefoneLista[5] ; // "3062"
    String numero = telefoneLista[6] + telefoneLista[7]  + telefoneLista[8]  + telefoneLista[9] ; // "0812"
    if (_validaDDD(int.parse(ddd), listaDosDDD) == false) return NumeroDeTelefone(ddd:'', prefixo: '', numero: '');
    if (prefixo.startsWith("0")) return NumeroDeTelefone(ddd:'', prefixo: '', numero: '');
    if (numero == "0000") return NumeroDeTelefone(ddd:'', prefixo: '', numero: '');
    return NumeroDeTelefone(ddd:ddd, prefixo: prefixo, numero: numero);
  }

  static NumeroDeTelefone _validaNumeroDeTelefoneCelular(String telefone, List<int> listaDosDDD) {
    /// 27930620812
    List<String> telefoneLista = telefone.split('');
    String ddd = telefoneLista[0] + telefoneLista[1]; // "27"
    String prefixo = telefoneLista[2] + telefoneLista[3] + telefoneLista[4] + telefoneLista[5] + telefoneLista[9] ; // "93062"
    String numero = telefoneLista[7] + telefoneLista[8] + telefoneLista[9] + telefoneLista[10] ; // "0812"
    if (_validaDDD(int.parse(ddd), listaDosDDD) == false)  return NumeroDeTelefone(ddd:'', prefixo: '', numero: '');
    if (!prefixo.startsWith("9"))  return NumeroDeTelefone(ddd:'', prefixo: '', numero: '');
    if (numero == "0000")  return NumeroDeTelefone(ddd:'', prefixo: '', numero: '');
    return NumeroDeTelefone(ddd:ddd, prefixo: prefixo, numero: numero);
  }

  static bool _verificaSeStringPossuiSomenteNumeros(String texto) {
    try{
      var value = int.parse(texto);
    } on FormatException {
      return false;
    } finally {
      return true;
    }
  }

  static bool _validaDDD(int ddd, List<int> listaDosDDD) {
    return listaDosDDD.contains(ddd);
  }
}