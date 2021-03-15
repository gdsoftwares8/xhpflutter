import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final AutovalidateMode autovalidateMode;
  final InputDecoration decoration;
  final dynamic validator;
  final Function onChanged;
  final TextInputType keyboardType;
  final Function onSaved;
  final bool obscureText;

  TextFormWidget(
      {this.autovalidateMode,
      this.decoration,
      this.keyboardType,
      this.onChanged,
      this.validator,
      this.onSaved,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
         decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText:"",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: obscureText,
      ),
    );
  }
}
