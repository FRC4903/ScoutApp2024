import 'package:flutter/material.dart';
import 'package:scout_app_2024/widgets.dart';

class PreGame extends StatefulWidget {
  const PreGame({Key? key, required this.inputs, required this.callback}) : super(key: key);

  final inputs;
  final callback;

  @override
  _PreGameState createState() => _PreGameState();
}

class _PreGameState extends State<PreGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center everything horizontally
            children: [
              TextInput(
                title: 'Scouter Name',
                callback: (value) => send('ScouterName', value),
                initial: widget.inputs['ScouterName'],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                children: [
                  Container(
                    width: 150,
                    child: CustomDropdown(
                      options: ['256', '4903', '1114', '2056', '8081', '63', '2025', '2', '3', '5', '23', '3', '25'],
                      callback: (value) => send('team', value),
                      initialValue: widget.inputs['team'].toString(),
                      label: "Team",
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 150,
                    child: CustomDropdown(
                      options: ['1', '3', '5', '6', '11', '12', ',42', '45', '56', '58', '72'],
                      callback: (value) => send('MatchNumber', value),
                      initialValue: widget.inputs['MatchNumber'].toString(),
                      label: "Match",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }
}