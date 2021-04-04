import 'package:flutter/material.dart';

class TextWidgetEditable extends StatelessWidget {
  final String text;
  final double textSize;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final BoxDecoration decoration;
  final TextDecoration textDecoration;
  final bool softWrap;
  final int maxLines;
  final TextEditingController controller;
  final Function onEdit;
  TextWidgetEditable({
    @required this.text,
    this.textSize = 12,
    this.width,
    this.decoration,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.backgroundColor = Colors.transparent,
    this.textAlign = TextAlign.start,
    this.fontFamily = FontStyles.fontName,
    this.maxLines,
    this.softWrap,
    this.textDecoration = TextDecoration.none,
    this.controller,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: decoration,
      // color: backgroundColor,
      padding: padding,
      // alignment: Alignment.ce,
      margin: margin,
      child: TextField(
        showCursor: true,
        readOnly: true,
        controller: controller,
        style: TextStyle(
          decoration: textDecoration,
          fontSize: textSize,
          color: color,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
        decoration: InputDecoration(
          labelText: text,
          suffixIcon: GestureDetector(
            onTap: onEdit,
            child: Icon(
              Icons.edit,
              size: 13,
            ),
          ),
        ),
      ),
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
