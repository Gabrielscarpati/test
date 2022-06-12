import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

import 'customEditor.dart';

class CustomDropdownButtonEditor<T extends MixInDescricao> extends CustomEditor<T, T> {
  final List<T> items;

  CustomDropdownButtonEditor({
    required this.items,
    required int selectedIndex,
    required String labelText,
    required IconData iconData,
    required Function(T newItem) onEditionComplete,
  }) : super(labelText: labelText, iconData: iconData, item: items[selectedIndex > 0 ? selectedIndex : 0], onEditionComplete: onEditionComplete);

  @override
  State<StatefulWidget> createState() => CustomDropdownButtonEditorState();
}

class CustomDropdownButtonEditorState<T extends MixInDescricao> extends CustomEditorState<T, T, CustomDropdownButtonEditor<T>> {
  T? selectedItem;

  @override
  Widget getEditingWidget(BuildContext context) {
    return DropdownButton<T>(
        value: selectedItem,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        isExpanded: true,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (T? newItem) {
          setState(() {
            selectedItem = newItem;
          });
        },
        items: widget.items.map<DropdownMenuItem<T>>((item) {
          return DropdownMenuItem(value: item, child: Text(item.getDescricao()));
        }).toList());
  }

  @override
  getEditionCompleteValue() {
    return selectedItem!;
  }
}

/*
class CustomDropdownButtonEditor extends StatefulWidget {
  final String text;
  final String labelText;
  final IconData iconData;
  final ViewActionsInfoUsuario viewActions;
  final ViewModelInfoUsuario viewModel;
  final List<BusinessModelCidade> listaCompletadeCidades;
  const CustomDropdownButtonEditor({
    Key? key,
    required this.text,
    required this.labelText,
    required this.iconData,
    required this.viewActions,
    required this.viewModel,
    required this.listaCompletadeCidades,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomDropdownButtonEditor();
}

class _CustomDropdownButtonEditor extends State<CustomDropdownButtonEditor> {
  bool editing = false;
  String dropdownValue = "1";
  @override
  Widget build(BuildContext context) {
    if (editing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(icons.close),
            onPressed: () {
              setState(() {
                editing = !editing;
              });
            },
          ),
          Expanded(
            child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(icons.arrow_downward),
                elevation: 16,
                isExpanded: true,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: widget.listaCompletadeCidades.map<DropdownMenuItem<String>>((cidade) {
                  return DropdownMenuItem(value: cidade.codCidade.toString(), child: Text(cidade.nome));
                }).toList()),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                editing = !editing;
              });
              widget.viewActions.onChangeCidade(dropdownValue, widget.viewModel);
            },
            icon: Icon(MdiIcons.check),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Icon(widget.iconData),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.labelText,
                  style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
                ),
                Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
                ),
              ],
            ),
          ]),
          IconButton(
            onPressed: () {
              setState(() {
                editing = !editing;
              });
            },
            icon: Icon(MdiIcons.pen),
          ),
        ],
      );
    }
  }
}
// MUDEI O ITEM SIZE DE 15 PARA 20
*/
