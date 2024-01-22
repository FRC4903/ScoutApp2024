import 'package:flutter/material.dart';
import 'widgets.dart';


class PreGame extends StatelessWidget {
  const PreGame({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'PreGame',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

