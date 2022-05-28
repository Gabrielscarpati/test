import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto_treinamento/framework/mixInDescricao.dart';

abstract class CustomEditor<T extends MixInDescricao, R extends Object> extends StatefulWidget {
  final String labelText;
  final IconData iconData;
  final T? item;
  final Function(R object) onEditionComplete;

  const CustomEditor({
    Key? key,
    required this.labelText,
    required this.iconData,
    required this.item,
    required this.onEditionComplete,
  }) : super(key: key);

}

abstract class CustomEditorState<T extends MixInDescricao, R extends Object, C extends CustomEditor<T, R>> extends State<C> {
  bool editing = false;

  @override
  Widget build(BuildContext context) {
    return editing ? _buildEditing(context) : _buildNotEditing(context);
  }

  Widget _buildNotEditing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(widget.iconData),
          SizedBox(
            width: 20,
          ),
          Container(
            width: screenWidth*0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.labelText,
                  style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
                ),
                Text(
                  (widget.item == null ? "" : widget.item!.getDescricao()),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
                ),
              ],
            ),
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

  Widget _buildEditing(BuildContext context) {
    return Row(
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
          child: getEditingWidget(context),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              editing = !editing;
            });
            widget.onEditionComplete(getEditionCompleteValue());
          },
          icon: Icon(MdiIcons.check),
        ),
      ],
    );
  }

  Widget getEditingWidget(BuildContext context);

  R getEditionCompleteValue();
}
