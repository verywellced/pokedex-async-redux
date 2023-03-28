import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double height;
  const VerticalSpace({
    super.key,
    required this.height,
  });
  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}
