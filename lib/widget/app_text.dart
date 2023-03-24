import 'package:pokedex_start/utilities/constant.dart';
import 'package:flutter/material.dart';

class BodySmallText extends StatelessWidget {
  const BodySmallText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ?? const TextStyle(fontSize: fontSizeSmallText),
    );
  }
}
