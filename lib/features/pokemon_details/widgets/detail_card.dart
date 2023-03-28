import 'package:pokedex_start/widget/app_text.dart';
import 'package:pokedex_start/widget/spacing.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadlineSmallText(text: title),
            const VerticalSpace(height: 10.0),
            ...children,
          ],
        ),
      ),
    );
  }
}
