import 'package:flutter/material.dart';

class PostGame extends StatelessWidget {
  const PostGame({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'PostGame',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
