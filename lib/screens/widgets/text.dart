import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
   const TextWidget({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    Color? mycolor = color;
    return Text(
      text,
      style: TextStyle(
        color: mycolor,
      ),
      textAlign: textAlign,
    );
  }
}
