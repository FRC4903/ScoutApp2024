import 'package:flutter/material.dart';

class TeleOp extends StatelessWidget {
  const TeleOp({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tele Op',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
