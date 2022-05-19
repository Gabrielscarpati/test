import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../hub/presenterHub.dart';

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
                  ),
                    SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: visibleCountries.length,
                          itemBuilder: (context,index) {
                            return Card(
                              color: Colors.white,

                              child: ListTile(
                                  onTap:(){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => PresenterHub.presenter()
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
                          }
                          ),
                    ),
        ],
    );
  }
}

