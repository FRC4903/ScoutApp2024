import 'package:flutter/material.dart';

class Auto extends StatefulWidget {
  const Auto({super.key, required this.inputs, required this.callback});

  final inputs;
  final callback;

  State<Auto> createState() => Funkyauto();
}

class Funkyauto extends State<Auto> {
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Auto',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
