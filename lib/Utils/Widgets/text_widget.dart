import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16.0,
    this.textAlign = TextAlign.center,
    this.decoration = TextDecoration.none,
    this.maxLine,
    this.shadow,
    this.textOverflow,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);
  final Color? color;
  final String text;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double fontSize;
  final List<Shadow>? shadow;

  final TextOverflow? textOverflow;
  final TextAlign textAlign;
  final int? maxLine;
  final TextDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      // overflow: TextOverflow.ellipsis,
      // softWrap: true,
      maxLines: maxLine,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        fontSize: fontSize,
        shadows: shadow,
      ),
    );
  }
}
