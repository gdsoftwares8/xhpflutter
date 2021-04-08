import 'package:flutter/material.dart';
import 'package:xhp/utils/global_vars.dart';

import 'text_widget.dart';

class NewTextWidget extends StatelessWidget {
 String text;
 double height;
 double width;
 

 NewTextWidget({this.height,this.text,this.width});
 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: width,


      
      decoration: BoxDecoration(color: GlobalVars.primaryColor,borderRadius:BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextWidget(text: text,textSize:15,fontWeight: FontWeight.bold,color: Colors.white,textAlign: TextAlign.center),
      )
    );
  }
}


class BoxTextFormWidget extends StatelessWidget {
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
  final bool enabled;
  final String initialValue;
  final double width;
  final double height;
  final TextStyle style;
  BoxTextFormWidget(
      {this.autovalidateMode,
      this.decoration,
      this.keyboardType,
      this.onChanged,
      this.validator,
      this.style,
      this.onSaved,
      this.obscureText,
      this.onTap,
      this.controller,
      this.readOnly,
      this.labelText,
      this.hintText,
      this.suffixIcon, this.enabled, this.initialValue,this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    
    return Container(
    
      width: size.width*.40,
      height: height,
      child: TextFormField(
        initialValue:initialValue,
        style: style,
       
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        enabled: enabled,
      
         decoration: 
         InputDecoration(
           filled: true,
           fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.all(10),
                labelText:labelText,
                hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                labelStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
                suffixIcon: suffixIcon,
                hintText: hintText,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                alignLabelWithHint: true,
              ),
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: false,
        onTap: onTap,
        controller: controller,
        readOnly:false,
      ),
    );
  }
}


class BoxTextFormWidgett extends StatelessWidget {
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
  final bool enabled;
  final String initialValue;
  final double width;
  final double height;

  BoxTextFormWidgett(
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
      this.suffixIcon, this.enabled, this.initialValue,this.width=50, this.height});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    
    return Container(
    
      width: width,
      height: height,
      child: TextFormField(
        initialValue:initialValue,
       
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        enabled: enabled,
         decoration: 
         InputDecoration(
           filled: true,
           fillColor: GlobalVars.primaryColor,
                contentPadding: EdgeInsets.all(10),
                labelText:labelText,
                labelStyle: TextStyle(color:Colors.white,fontSize:12,fontWeight: FontWeight.bold,),
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: TextStyle(color:Colors.white,fontSize:12,fontWeight: FontWeight.bold,),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                alignLabelWithHint: true,
              ),
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: false,
        onTap: onTap,
        controller: controller,
        readOnly:false,
      ),
    );
  }
}