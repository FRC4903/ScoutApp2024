import 'package:flutter/material.dart';
import 'main.dart';
import 'widgets.dart';


class Endgame extends StatelessWidget {
  const Endgame({Key? key, required this.inputs, required this.callback})
      : super(key: key);

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


