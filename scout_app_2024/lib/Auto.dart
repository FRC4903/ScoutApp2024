import 'package:flutter/material.dart';

class Auto extends StatefulWidget {
  const Auto({super.key, required this.inputs, required this.callback});

  final inputs;
  final callback;

  @override
  State<Auto> createState() => Funkyauto();
}

class Funkyauto extends State<Auto> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Auto',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
