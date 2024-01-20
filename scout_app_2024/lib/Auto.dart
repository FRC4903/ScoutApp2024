import 'package:flutter/material.dart';

<<<<<<< Updated upstream
class Auto extends StatelessWidget {
  const Auto({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
=======
class Auto extends StatefulWidget {
  const Auto({super.key, required this.inputs, required this.callback});

  final inputs;
  final callback;

>>>>>>> Stashed changes
  @override
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
