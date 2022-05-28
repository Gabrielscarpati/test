import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomEditPrestadorInformationNome extends StatefulWidget {
  final String labelText;
  final IconData iconData;
  final Function(String newText) onEditionComplete;
  final String item;
  final String hintText;

  const CustomEditPrestadorInformationNome({Key? key,
    required this.labelText,
    required this.iconData,
    required this.onEditionComplete,
    required this.item,
    required this.hintText,

}) : super(key: key);


  @override
  _CustomEditPrestadorInformationNomeState createState() => _CustomEditPrestadorInformationNomeState();
}

class _CustomEditPrestadorInformationNomeState extends State<CustomEditPrestadorInformationNome> {
  bool editing = false;
  final formKey = new GlobalKey<FormState>();
  late TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return editing ? _buildEditing(context) : _buildNotEditing(context);
  }

    Widget _buildNotEditing(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return Form(
        key: formKey,
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      widget.iconData,
                    ),
                    SizedBox(width: 20,),

                    Container(
                      height: 36,
                      width: screenWidth*0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.labelText, style:Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),),
                          SizedBox(height: 4,),
                          Text(widget.item, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize)),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {

                    setState(() {
                      editing = !editing;
                    });

                    },
                  icon: Icon(MdiIcons.pen),
                ),
              ],
        ),
      );
    }

    Widget _buildEditing(BuildContext context) {
      return  Form(
        key: formKey,
        child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        editing = !editing;
                      });
                    },
                  ),
                  Expanded(
                    child:
                    TextFormField(
                      controller: textEditingController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (textEditingController) {
                        if (textEditingController!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(textEditingController)){
                          return "Enter a valid name";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (text) {
                        print(text);
                      },
                      decoration: new InputDecoration(
                        prefixIcon: Icon(super.widget.iconData),
                        labelText: widget.hintText,
                        hintText: widget.hintText,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                  ),
                  IconButton(

                    onPressed: () {

                      if (formKey.currentState!.validate()) {

                        setState(() {
                          editing = !editing;
                          });
                      widget.onEditionComplete(getEditionCompleteValue());

                      };
                      },

                    icon: Icon(MdiIcons.check),
                  ),

                ],

        ),
      );
    }
  getEditionCompleteValue() {
    return textEditingController.text;
  }

}










class CustomEditPrestadorInformationTelefone extends StatefulWidget {
  final String labelText;
  final IconData iconData;
  final Function(String newText) onEditionComplete;
  final String item;
  final String hintText;

  const CustomEditPrestadorInformationTelefone({Key? key,
    required this.labelText,
    required this.iconData,
    required this.onEditionComplete,
    required this.item,
    required this.hintText,

  }) : super(key: key);


  @override
  _CustomEditPrestadorInformationTelefoneState createState() => _CustomEditPrestadorInformationTelefoneState();
}

class _CustomEditPrestadorInformationTelefoneState extends State<CustomEditPrestadorInformationTelefone> {
  bool editing = false;
  final formKey = new GlobalKey<FormState>();
  late TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return editing ? _buildEditing(context) : _buildNotEditing(context);
  }

  Widget _buildNotEditing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                widget.iconData,
              ),
              SizedBox(width: 20,),

              Container(
                height: 36,
                width: screenWidth*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.labelText, style:Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),),
                    SizedBox(height: 4,),
                    Text(widget.item, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize)),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {

              setState(() {
                editing = !editing;
              });

            },
            icon: Icon(MdiIcons.pen),
          ),
        ],
      ),
    );
  }

  Widget _buildEditing(BuildContext context) {
    return  Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                editing = !editing;
              });
            },
          ),
          Expanded(
            child:
            TextFormField(
              controller: textEditingController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (textEditingController) {
                if ( textEditingController!.isEmpty|| textEditingController.length !=10  || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(textEditingController)){
                  return "Enter a valid phone number: 9999999999";
                } else{
                  return null;
                }
              },
              onChanged: (text) {
                print(text);
              },
              decoration: new InputDecoration(
                prefixIcon: Icon(super.widget.iconData),
                labelText: widget.hintText,
                hintText: widget.hintText,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
          ),
          IconButton(

            onPressed: () {

              if (formKey.currentState!.validate()) {

                setState(() {
                  editing = !editing;
                });
                widget.onEditionComplete(getEditionCompleteValue());

              };
            },

            icon: Icon(MdiIcons.check),
          ),

        ],

      ),
    );
  }
  getEditionCompleteValue() {
    return textEditingController.text;
  }

}











class CustomEditPrestadorInformationDescricao extends StatefulWidget {
  final String labelText;
  final IconData iconData;
  final Function(String newText) onEditionComplete;
  final String item;
  final String hintText;

  const CustomEditPrestadorInformationDescricao({Key? key,
    required this.labelText,
    required this.iconData,
    required this.onEditionComplete,
    required this.item,
    required this.hintText,

  }) : super(key: key);


  @override
  _CustomEditPrestadorInformationDescricaoState createState() => _CustomEditPrestadorInformationDescricaoState();
}

class _CustomEditPrestadorInformationDescricaoState extends State<CustomEditPrestadorInformationDescricao> {
  bool editing = false;
  final formKey = new GlobalKey<FormState>();
  late TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return editing ? _buildEditing(context) : _buildNotEditing(context);
  }

  Widget _buildNotEditing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                widget.iconData,
              ),
              SizedBox(width: 20,),

              Container(
                height: 36,
                width: screenWidth*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.labelText, style:Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),),
                    SizedBox(height: 4,),
                    Text(widget.item, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize)),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {

              setState(() {
                editing = !editing;
              });

            },
            icon: Icon(MdiIcons.pen),
          ),
        ],
      ),
    );
  }

  Widget _buildEditing(BuildContext context) {
    return  Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                editing = !editing;
              });
            },
          ),
          Expanded(
            child:
            TextFormField(
              controller: textEditingController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (textEditingController) {
                if (textEditingController!.isEmpty){
                  return "Enter a valid description";
                }else{
                  return null;
                }
              },
              onChanged: (text) {
                print(text);
              },
              decoration: new InputDecoration(
                prefixIcon: Icon(super.widget.iconData),
                labelText: widget.hintText,
                hintText: widget.hintText,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
          ),
          IconButton(

            onPressed: () {

              if (formKey.currentState!.validate()) {

                setState(() {
                  editing = !editing;
                });
                widget.onEditionComplete(getEditionCompleteValue());

              };
            },

            icon: Icon(MdiIcons.check),
          ),

        ],

      ),
    );
  }
  getEditionCompleteValue() {
    return textEditingController.text;
  }

}











class CustomEditPrestadorInformationHorasDeTrabaho extends StatefulWidget {
  final String labelText;
  final IconData iconData;
  final Function(String newText) onEditionComplete;
  final String item;
  final String hintText;

  const CustomEditPrestadorInformationHorasDeTrabaho({Key? key,
    required this.labelText,
    required this.iconData,
    required this.onEditionComplete,
    required this.item,
    required this.hintText,

  }) : super(key: key);


  @override
  _CustomEditPrestadorInformationHorasDeTrabahoState createState() => _CustomEditPrestadorInformationHorasDeTrabahoState();
}

class _CustomEditPrestadorInformationHorasDeTrabahoState extends State<CustomEditPrestadorInformationHorasDeTrabaho> {
  bool editing = false;
  final formKey = new GlobalKey<FormState>();
  late TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return editing ? _buildEditing(context) : _buildNotEditing(context);
  }

  Widget _buildNotEditing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                widget.iconData,
              ),
              SizedBox(width: 20,),

              Container(
                height: 36,
                width: screenWidth*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.labelText, style:Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),),
                    SizedBox(height: 4,),
                    Text(widget.item, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize)),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {

              setState(() {
                editing = !editing;
              });

            },
            icon: Icon(MdiIcons.pen),
          ),
        ],
      ),
    );
  }

  Widget _buildEditing(BuildContext context) {
    return  Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                editing = !editing;
              });
            },
          ),
          Expanded(
            child:
            TextFormField(
              controller: textEditingController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (textEditingController) {
                if (textEditingController!.isEmpty){
                  return "Digite as horas que voce trabalha";
                }else{
                  return null;
                }
              },
              onChanged: (text) {
                print(text);
              },
              decoration: new InputDecoration(
                prefixIcon: Icon(super.widget.iconData),
                labelText: widget.hintText,
                hintText: widget.hintText,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
          ),
          IconButton(

            onPressed: () {

              if (formKey.currentState!.validate()) {


                setState(() {
                  editing = !editing;
                });
                widget.onEditionComplete(getEditionCompleteValue());

              };
            },

            icon: Icon(MdiIcons.check),
          ),

        ],

      ),
    );
  }
  getEditionCompleteValue() {
    return textEditingController.text;
  }

}










class CustomEditPrestadorInformationServicosPrestados extends StatefulWidget {
  final String labelText;
  final IconData iconData;
  final Function(String newText) onEditionComplete;
  final String item;
  final String hintText;

  const CustomEditPrestadorInformationServicosPrestados({Key? key,
    required this.labelText,
    required this.iconData,
    required this.onEditionComplete,
    required this.item,
    required this.hintText,

  }) : super(key: key);


  @override
  _CustomEditPrestadorInformationServicosPrestadosState createState() => _CustomEditPrestadorInformationServicosPrestadosState();
}

class _CustomEditPrestadorInformationServicosPrestadosState extends State<CustomEditPrestadorInformationServicosPrestados> {
  bool editing = false;
  final formKey = new GlobalKey<FormState>();
  late TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return editing ? _buildEditing(context) : _buildNotEditing(context);
  }

  Widget _buildNotEditing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                widget.iconData,
              ),
              SizedBox(width: 20,),

              Container(
                height: 36,
                width: screenWidth*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.labelText, style:Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),),
                    SizedBox(height: 4,),
                    Text(widget.item, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize)),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {

              setState(() {
                editing = !editing;
              });

            },
            icon: Icon(MdiIcons.pen),
          ),
        ],
      ),
    );
  }

  Widget _buildEditing(BuildContext context) {
    return  Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                editing = !editing;
              });
            },
          ),
          Expanded(
            child:
            TextFormField(
              controller: textEditingController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (textEditingController) {
                if (textEditingController!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(textEditingController)){
                  return "Enter a valid name";
                }else{
                  return null;
                }
              },
              onChanged: (text) {
                print(text);
              },
              decoration: new InputDecoration(
                prefixIcon: Icon(super.widget.iconData),
                labelText: widget.hintText,
                hintText: widget.hintText,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
          ),
          IconButton(

            onPressed: () {

              if (formKey.currentState!.validate()) {

                setState(() {
                  editing = !editing;
                });
                widget.onEditionComplete(getEditionCompleteValue());

              };
            },

            icon: Icon(MdiIcons.check),
          ),
        ],
      ),
    );
  }
  getEditionCompleteValue() {
    return textEditingController.text;
  }

}



