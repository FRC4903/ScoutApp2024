import 'package:flutter/material.dart';
import 'widgets.dart';

class Endgame extends StatefulWidget {
  const Endgame({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
  @override
  _Endgame createState() => _Endgame();
}

class _Endgame extends State<Endgame>
{
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CheckboxInput(
                    title: 'Parked',
                    initial: widget.inputs['Parked'],
                    callback: (value) => send('Parked', value),
                  ),
                  SizedBox(width: 20),
                  CheckboxInput(
                    title: 'Onstage Climb',
                    initial: widget.inputs['OnStageClimb'],
                    callback: (value) => send('OnStageClimb', value),
                  ),
                

  
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CheckboxInput(
                    title: 'Won',
                    initial: widget.inputs['Won'],
                    callback: (value) => send('Won', value),
                  ),
                  SizedBox(width: 20),
                  CheckboxInput(
                    title: 'Harmony',
                    initial: widget.inputs['Harmony'],
                    callback: (value) => send('Harmony', value),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Increment(
                    title: 'Human Player Attempts',
                    value: widget.inputs['HumanAttempts'],
                    callback: (value) => send('HumanAttempts', value),
                  ),
                  Increment(
                    title: 'Human Player Successes',
                    value: widget.inputs['HumanPlayerSuccess'],
                    callback: (value) => send('HumanPlayerSuccess', value),
                  ),
                  Increment(
                    title: 'Ranking Points',
                    value: widget.inputs['RP'],
                    callback: (value) => send('RP', value),
                  ),
                  Increment(
                    title: 'NoteInTrap',
                    value: widget.inputs['NoteInTrap'],
                    callback: (value) => send('NoteInTrap', value),
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


