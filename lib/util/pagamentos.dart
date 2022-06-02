import 'package:cielo_ecommerce/cielo_ecommerce.dart';

class Pagamentos {
  final CieloEcommerce cielo = CieloEcommerce(
      environment: Environment.sandbox,
      merchant: Merchant(
        merchantId: "SEU_MERCHANT_ID",
        merchantKey: "SEU_MERCHANT_KEY",
      ));

  makePayment() async {
    print("Transação Simples");
    print("Iniciando pagamento....");
    //Objeto de venda
    Sale sale = Sale(
      merchantOrderId: "2020032601", // Numero de identificação do Pedido
      customer: Customer(
        name: "Comprador crédito simples", // Nome do Comprador
      ),
      payment: Payment(
          type: TypePayment.creditCard, // Tipo do Meio de Pagamento
          amount: 9, // Valor do Pedido (ser enviado em centavos)
          installments: 1, // Número de Parcelas
          softDescriptor:
              "Mensagem", // Descrição que aparecerá no extrato do usuário. Apenas 15 caracteres
          creditCard: CreditCard(
            cardToken: await getCardToken(), // Cartão tokenizado
            securityCode:
                '123', // Código de segurança impresso no verso do cartão
            brand: 'Visa', // Bandeira do cartão
          )),
    );

    try {
      var response = await cielo.createSale(sale);

      print('paymentId ${response!.payment!.paymentId}');
    } on CieloException catch (e) {
      print(e);
      print(e.message);
      print(e.errors[0].message);
      print(e.errors[0].code);
    }
  }

  Future<String?> getCardToken() async {
    String? response = "";
    print("Tokenizando cartão....");

    CreditCard cart = CreditCard(
      customerName: "Comprador Teste Cielo",
      cardNumber: "4532117080573700",
      securityCode: "123",
      holder: "Comprador T Cielo",
      expirationDate: "12/2030",
      brand: "Visa",
    );
    try {
      var response = await cielo.tokenizeCard(cart);
      if (response != null) {
        print(response.cardToken);
        print(response.cardNumber);
      }
    } on CieloException catch (e) {
      print(e);
      print(e.message);
      print(e.errors[0].message);
      print(e.errors[0].code);
    }

    return response;
  }

  pagamentoBoleto() async {
    print("Operação por Boleto");
    print("Gerando boleto....");
    //Objeto de venda
    Sale sale = Sale(
      merchantOrderId: "2020032601", // Numero de identificação do Pedido
      customer: Customer(
          name: "Comprador crédito simples", // Nome do Comprador
          identity: "12345678909", // Número do CPF
          address: Address(
              street: "Avenida Marechal Câmara", // Endereço do Comprador.
              number: "160", // Número do endereço do Comprador.
              complement: "Sala 934",
              zipCode: "22750012", // CEP do endereço do Comprador.
              district: "Centro", // Bairro do Comprador.
              city: "Rio de Janeiro", // Cidade do endereço do Comprador.
              state: "RJ", // Estado do endereço do Comprador.
              country: "BRA" // Pais do endereço do Comprador.
              )),
      payment: Payment(
        type: TypePayment.boleto, // Tipo do Meio de Pagamento
        amount: 10, // Valor do Pedido (ser enviado em centavos)
        provider:
            "bradesco2", // Banco (A API Aceita apenas boletos Bradesco e Banco do Brasil).
        address: "Rua Teste", // Nome do Cedente.
        boletoNumber:
            "123", // Número do Boleto enviado pelo lojista. Usado para contar boletos emitidos (“NossoNumero”).
        assignor: "Empresa Teste",
        demonstrative: "Desmonstrative Teste", // Texto de Demonstrativo.
        expirationDate:
            "5/1/2015", // Data de expiração do Boleto. Ex. 2020-12-31
        identification: "11884926754", // Documento de identificação do Cedente.
        instructions:
            "Aceitar somente até a data de vencimento, após essa data juros de 1% dia.", // Instruções do Boleto.
      ),
    );

    try {
      var response = await cielo.createSale(sale);

      if (response != null && response.payment != null) {
        print('paymentId ${response.payment!.paymentId}');
        print('payment ${response.payment!.toJson()}');
        print('url do boleto ${response.payment!.url}');
        print('link de consulta ${response.payment!.links![0].href}');

        String? paymentId = response.payment!.paymentId;
        int? status = response.payment!.status;
      }
    } on CieloException catch (e) {
      print(e);
      print(e.message);
      print(e.errors[0].message);
      print(e.errors[0].code);
    }
  }
}
