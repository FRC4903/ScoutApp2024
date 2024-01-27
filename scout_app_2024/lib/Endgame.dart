import 'package:flutter/material.dart';
import 'main.dart';
import 'widgets.dart';

class Endgame extends StatelessWidget {
  const Endgame({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Endgame',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}


