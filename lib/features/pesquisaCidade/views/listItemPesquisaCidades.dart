import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/businessModels/businessModelCidade.dart';
import 'package:projeto_treinamento/businessModels/businessModelIcone.dart';
import 'package:substring_highlight/substring_highlight.dart';

class listItemPesquisaCidades extends StatelessWidget {
  final BusinessModelCidade cidade;
  final BusinessModelIcone iconeCidade;
  final String argumentoDePesquisa;
  final int quantidadeDePrestadores;

  const listItemPesquisaCidades({
    Key? key,
    required this.cidade,
    required this.iconeCidade,
    required this.argumentoDePesquisa,
    required this.quantidadeDePrestadores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
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
      ),
    );
  }
}



/*
mport 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resoultSearchCityItem/ViewResoultSearchCityItem.dart';

class ListChangeCity extends StatefulWidget {
  const ListChangeCity({Key? key}) : super(key: key);

  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<ListChangeCity> {
  @override
  List<String> countries = ['New York City', 'Los Angeles', 'Chicago', 'Houston',  'Phoenix',
    'Philadelphia', 'San Antonio', 'Dallas', 'San Jose', 'Austin', 'Jacksonville', 'Fort Worth',
    'Columbus', 'Indianapolis', 'Charlotte', 'San Francisco', 'Seattle', 'Denver',  'Washington', 'Nashville'];
  late List<String> visibleCountries;

  @override
  void initState() {
    visibleCountries = countries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  visibleCountries = countries
                      .where((country) => (country.toLowerCase()).contains(value.toLowerCase()))
                      .toList();
                  setState(() {});
                },
                decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.search),
                  labelText: "Search City",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),

        Padding(
            padding: EdgeInsets.all(8.0),

            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: visibleCountries.length,
                      itemBuilder: (context,index) {
                        return Card(
                          color: Colors.white,

                          child: ListTile(
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewResoultSearchCityItem()
                                ));
                              },
                              title: Text(visibleCountries[index],

                                style: TextStyle(
                                    color: Colors.black
                                ),
                              ),
                              leading: Icon(Icons.location_city)
                          ),
                        );
                      }),
                ],
              ),
            ),
        ),
      ],
    );
  }
}


 */
