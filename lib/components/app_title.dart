import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String title;

  const AppTitle({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }
}
