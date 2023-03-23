import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.appBarText,
    this.body,
  });

  final String appBarText;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarText),
        ),
        body: body,
      ),
    );
  }
}
