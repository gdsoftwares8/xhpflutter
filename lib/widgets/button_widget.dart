
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final double width;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final BoxDecoration decoration;
  final TextDecoration textDecoration;
  final VoidCallback onPressed;

  const ButtonWidget(
      {@required this.text = "Blank",
        @required this.onPressed,
        this.textSize = 15,
        this.width,
        this.height = 50,
        this.decoration,
        this.padding = const EdgeInsets.all(0.0),
        this.margin = const EdgeInsets.all(0.0),
       // this.color = const Color(0xFF1E88E5),
       this.color=Colors.white,
        
        this.fontWeight = FontWeight.w600,
        this.backgroundColor = Colors.transparent,
        this.textAlign = TextAlign.start,
        this.fontFamily = FontStyles.fontName,
        this.textDecoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: onPressed,
    //   //style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange) ),
    //   child: Text(text ),
    // );
    return Container(
      width: width,
      height: height,
      decoration: decoration,
       // color: Colors.orange[900],
      padding: padding,
      // alignment: Alignment.ce,
      margin: margin,
      child: ElevatedButton(
       // style: ButtonStyle(backgroundColor: Colors.orange[850] ),
        
        onPressed: onPressed,
      //  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[900]) ),
        child: Text(
            text,
          style: TextStyle(
            decoration: textDecoration,
            fontSize: textSize,
            color: color,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
          ),
          textAlign: textAlign,),
      )

    );
  }
}

class FontStyles {
  static FontWeight thin = FontWeight.w100;
  static const String fontName = 'OpenSans';
  static FontWeight extraLight = FontWeight.w200;
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;
}
