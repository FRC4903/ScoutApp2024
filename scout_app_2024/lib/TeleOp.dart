import 'package:flutter/material.dart';
import 'widgets.dart';


  class MyStatefulWidget extends StatefulWidget {

      const MyStatefulWidget({super.key, required this.inputs, required this.callback});

      final inputs;
      final callback;    
      @override
      _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
    }
    
    class _MyStatefulWidgetState extends State<MyStatefulWidget> {
       @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: ListView(children: [
      SizedBox(
        height: 600,
        child: Column(children: [
          const Center(
            child: Text(
              'Pre-Match',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(children: [
              TextInput(
                  title: 'team number',
                  initial: widget.inputs['team'],
                  callback: (value) => send('team', value)),
              const SizedBox(height: 20),
              TextInput(
                  title: 'match number',
                  initial: widget.inputs['match'],
                  callback: (value) => send('match', value)),
              const SizedBox(height: 20),
              TextInput(
                  title: 'scouter',
                  initial: widget.inputs['scouter'],
                  callback: (value) => send('scouter', value)),
            ])
          ])
        ]),
      ),
    ])));
    }

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }
}