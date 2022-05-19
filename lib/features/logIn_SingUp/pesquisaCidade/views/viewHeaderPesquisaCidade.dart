import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/features/hub/views/viewHubUsuario.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewModelPesquisaCidade.dart';
import 'package:projeto_treinamento/features/pesquisaCidade/viewPesquisaCidade.dart';


class ViewHeaderPesquisaCidadea extends StatefulWidget {
  ViewHeaderPesquisaCidadea({
    Key? key,});

  @override
  State<ViewHeaderPesquisaCidadea> createState() => _ViewHeaderPesquisaCidadeaState();
}

class _ViewHeaderPesquisaCidadeaState extends State<ViewHeaderPesquisaCidadea> {



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
    return Column(
      children: [
        TextField(
          //controller: viewModel.controlerFieldPesquisa,
          onChanged: (value) {
            visibleCountries = countries
                .where((country) => (country.toLowerCase()).contains(value.toLowerCase()))
                .toList();
            setState(() {});
          },
          decoration: new InputDecoration(
            filled: true,

            fillColor: Colors.white,
            prefixIcon: new Icon(Icons.search,
              color: Colors.blue.shade800,
            ),
            labelText: "Pesquisa pela cidade",
              labelStyle: TextStyle(
                color: Colors.blue.shade800,
              ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        )
      ],
    );
  }
}
