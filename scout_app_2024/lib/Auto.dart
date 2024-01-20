import 'package:flutter/material.dart';

class Auto extends StatelessWidget {
  const Auto({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
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
