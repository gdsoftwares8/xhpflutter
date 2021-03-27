import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final AutovalidateMode autovalidateMode;
  final InputDecoration decoration;
  final dynamic validator;
  final Function onChanged;
  final TextInputType keyboardType;
  final Function onSaved;
  final bool obscureText;
  final Function onTap;
  final TextEditingController controller;
  final bool readOnly;
  final String labelText;
  final Widget suffixIcon;
  final String hintText;

  TextFormWidget(
      {this.autovalidateMode,
      this.decoration,
      this.keyboardType,
      this.onChanged,
      this.validator,
      this.onSaved,
      this.obscureText,
      this.onTap,
      this.controller,
      this.readOnly,
      this.labelText,
      this.hintText,
      this.suffixIcon,});

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
       decoration: 
       InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText:labelText,
              suffixIcon: suffixIcon,
              hintText: hintText,
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: false,
      onTap: onTap,
      controller: controller,
      readOnly:false,
    );
  }
}
