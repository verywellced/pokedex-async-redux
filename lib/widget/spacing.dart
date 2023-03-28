import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double width;
  const HorizontalSpace({
    super.key,
    required this.width,
  });
  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}

class VerticalSpace extends StatelessWidget {
  final double height;
  const VerticalSpace({
    super.key,
    required this.height,
  });
  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class ExpandedSpace extends StatelessWidget {
  const ExpandedSpace({super.key});
  @override
  Widget build(BuildContext context) => const Expanded(child: SizedBox());
}
