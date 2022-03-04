
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

import 'customEditor.dart';

class CustomTextEditor<T extends MixInDescricao> extends CustomEditor<T, String> {
  CustomTextEditor({
    required String labelText,
    required IconData iconData,
    required T? item,
    required Function(String newText) onEditionComplete,
  }) : super(labelText: labelText, iconData: iconData, item: item, onEditionComplete: onEditionComplete);

  @override
  State<StatefulWidget> createState() => CustomTextEditorState();
}

class CustomTextEditorState<T extends MixInDescricao> extends CustomEditorState<T, String, CustomTextEditor<T>> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  late TextEditingController textEditingController = TextEditingController(text:'fefvv');// super.widget.item == null ? "" : super.widget.item!.getDescricao());

  @override
  Widget getEditingWidget(BuildContext context) {
    return TextField(
      key: _formKey,
      controller: textEditingController,
      onChanged: (text) {
        print(text);
      },
      decoration: new InputDecoration(
        prefixIcon: Icon(super.widget.iconData),
        labelText: super.widget.labelText,
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
    );
  }

  @override
  getEditionCompleteValue() {
    return textEditingController.text;
  }
}

