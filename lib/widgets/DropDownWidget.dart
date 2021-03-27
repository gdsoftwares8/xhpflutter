import 'package:flutter/material.dart';

import 'text_widget.dart';
import 'package:xhp/utils/global_vars.dart';

class DropDownWidget extends StatefulWidget {
  String value;
  bool isExpanded;
  Widget hint;
  List items;
  Function onChanged;

  DropDownWidget({this.hint,this.isExpanded,this.items,this.onChanged,this.value});

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: GlobalVars.accentColor, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            isExpanded: widget.isExpanded,
            hint: widget.hint,
            value: widget.value,
            items: widget.items,
            onChanged: (String val) {},
          ),
        ),
      ),
    );
  }
}
