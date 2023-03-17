import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          // TODO: This text will be remove
          child: Text('This app is working'),
        ),
      ),
    );
  }
}
