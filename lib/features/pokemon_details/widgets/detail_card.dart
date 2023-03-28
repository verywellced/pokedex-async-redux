import 'package:pokedex_start/utilities/constant.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:pokedex_start/widget/spacing.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsCard extends StatelessWidget {
  DetailsCard({
    super.key,
    required this.title,
    this.children = const <Widget>[],
  });

  final String title;
  List<Widget> children;

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
            const VerticalSpace(height: spacingXSmall),
            ...children,
          ],
        ),
      ),
    );
  }
}
