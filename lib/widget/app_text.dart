import 'package:flutter/material.dart';

class BodySmallText extends StatelessWidget {
  const BodySmallText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ?? Theme.of(context).textTheme.bodySmall,
    );
  }
}

class HeadlineSmallText extends StatelessWidget {
  const HeadlineSmallText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ?? Theme.of(context).textTheme.headlineSmall,
    );
  }
}
