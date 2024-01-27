import 'package:flutter/material.dart';
import 'widgets.dart';

class Endgame extends StatelessWidget {
  const Endgame({Key? key, required this.inputs, required this.callback})
      : super(key: key);

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
          CheckboxListTileExample(headerName: "Parked"),
          CheckboxListTileExample(headerName: "Climbed onstage"),
          CheckboxListTileExample(headerName: "Harmony"),
          CheckboxListTileExample(headerName: "Spotlight"),

          Increment(
          title: 'My Increment Widget',
          callback: (int value) {
            print('New value: $value');},
          value: 10
        ),
         
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0), // Align the TextFormField to the left
            child: SizedBox(
              width: 600,
              child: TextFormField(
                minLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Reliability comments',
                  hintText: 'Hint',
                ),             
              ),
            ),
          ),
        ],
      ),
    );

    
  }
}
