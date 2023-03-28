import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({
    required this.height,
    super.key,
  });

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}
