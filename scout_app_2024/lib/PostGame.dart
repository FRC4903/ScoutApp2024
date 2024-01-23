import 'package:flutter/material.dart';
import 'widgets.dart';

typedef StringCallback = void Function(String value);

class PostGame extends StatelessWidget {
  const PostGame({Key? key, required this.inputs, required this.callback}) : super(key: key);

  final inputs;
  final callback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'PostGame',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}



