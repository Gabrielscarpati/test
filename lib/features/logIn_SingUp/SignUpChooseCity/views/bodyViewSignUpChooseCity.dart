import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/logIn_SingUp/veryFirstScreen/veryFirstScreenUserType.dart';
import 'package:substring_highlight/substring_highlight.dart';

class BodyViewSignUpChooseCity extends StatefulWidget {
  @override
  _BodyViewSignUpChooseCityState createState() => _BodyViewSignUpChooseCityState();
}

class _BodyViewSignUpChooseCityState extends State<BodyViewSignUpChooseCity> {
  List <String> listChoosenServicesByUser =[];

  List<String> listWorkers = [
    'Pintor', 'Encanador', 'Limpeza de lotes', 'Carpinteiro', 'Confeiteiro', 'Designer gráfico', 'Designer', 'Planejador de eventos', 'Caseiro',
    'Eletricista','Mecânico', 'Pedreiro', 'Soldador', 'Motorista pessoal', 'Cortador de grama', 'Secretária', 'Vendedor', 'Comprador / importador',
    'Instalador de piso', 'Reparos gerais para casa', 'Frete de pequenas distâncias', 'Mudanças', 'Montador de móveis', 'Ajudante de mudanças', 'Designer de logo',
    'Ajudante de pedreiro', 'Fotografo', 'Instrutor fitness', 'Professor partícular', 'Social media', 'Cuidador de idosos', 'Cuidador de animais'
        'Babá', 'Massagista', 'Exterminador de pragas'
  ];
  List<String>? workersListSearch;
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
            backgroundColor: Colors.blue.shade300,
            title: Column(


              children: [
                Text('Search for the city that\nyou want to work'),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(    //Icon(Icons.close)
                    controller: _textEditingController,
                    focusNode: _textFocusNode,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search, size: 32,),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Click here', hintStyle: TextStyle(fontSize: 24),
                        contentPadding: EdgeInsets.all(8)),
                        onChanged: (value) {
                        setState(() {
                        workersListSearch = listWorkers
                            .where(
                                (element) => element.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                        if (_textEditingController!.text.isNotEmpty &&
                            workersListSearch!.length == 0) {
                          print('foodListSearch length ${workersListSearch!.length}');
                        }
                      });
                    },
                  ),
                ),
              ],
            )),
        body: _textEditingController!.text.isNotEmpty &&
            workersListSearch!.length == 0
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search_off,
                                size: 160,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No results found,\nPlease try different keyword',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                     )
            : ListView.builder(
            itemCount: _textEditingController!.text.isNotEmpty
                ? workersListSearch!.length
                : listWorkers.length,
            itemBuilder: (ctx, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),

                child: InkWell(
                  onTap: () {
                    listChoosenServicesByUser.add(_textEditingController!.text);
                    /*Navigatorof(context).push(MaterialPageRoute(
                        builder: (context) => ViewVeryFirstScreen(),
                    ));*/
                         print(listChoosenServicesByUser);
                  },
                  child: ListTile(
                      hoverColor: Theme.of(context).cardTheme.shadowColor,
                      title: SubstringHighlight(
                        text:  workersListSearch == null? listWorkers[index] : workersListSearch![index],
                        caseSensitive: false,
                        overflow: TextOverflow.ellipsis,
                        term: _textEditingController?.text,
                        textAlign: TextAlign.left,
                        textStyleHighlight: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor: Theme.of(context).textTheme.headline2!.backgroundColor,
                        ),
                        words: false,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( '20' + " Prestadores nessa cidade"),
                        ],
                      ),
                      leading: Icon(Icons.arrow_circle_down)),
                ),
              );
            }));
  }
}

/*
InkWell(
        onTap: () {
          Navigator.of(context).pop(this.cidade.codCidade);
        },
        child: ListTile(
            hoverColor: Theme.of(context).cardTheme.shadowColor,
            title: SubstringHighlight(
              text: cidade.nome,
              caseSensitive: false,
              overflow: TextOverflow.ellipsis,
              terms: [argumentoDePesquisa],
              textAlign: TextAlign.left,
              textStyleHighlight: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).textTheme.headline2!.backgroundColor,
              ),
              words: false,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quantidadeDePrestadores.toString() + " Prestadores nessa cidade"),

              ],
            ),
            leading: Icon(this.iconeCidade.icone, color: Theme.of(context).iconTheme.color)),
      ),*/