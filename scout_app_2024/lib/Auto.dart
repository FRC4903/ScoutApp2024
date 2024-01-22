import 'package:flutter/material.dart';

class Auto extends StatelessWidget {
  const Auto({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Autonomous',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}




// class SampleTextInput extends StatefulWidget {
//   const SampleTextInput({super.key});

//   @override
//   State<SampleTextInput> createState() => _SampleTextInputState();
// }

// class _SampleTextInputState extends State<SampleTextInput> {
  
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }