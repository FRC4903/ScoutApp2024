import 'package:flutter/material.dart';
import 'widgets.dart';


class Endgame extends StatelessWidget {
  const Endgame({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
  @override
  Widget build(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'EndGame',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        CheckboxListTileExample(headerName: "Test value", subtitleName: "Subtitle test value"),
      ],
    ),
  );
}
}


