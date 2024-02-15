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
  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckboxInput(
                    title: 'Parked',
                    initial: widget.inputs['Parked'],
                    callback: (value) => send('Parked', value),
                  ),
                  const SizedBox(width: 20),
                  CheckboxInput(
                    title: 'Onstage Climb',
                    initial: widget.inputs['OnStageClimb'],
                    callback: (value) => send('OnStageClimb', value),
                  ),
                

  
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  CheckboxInput(
                    title: 'Won',
                    initial: widget.inputs['Won'],
                    callback: (value) => send('Won', value),
                  ),
                  const SizedBox(width: 20),
                  CheckboxInput(
                    title: 'Harmony',
                    initial: widget.inputs['Harmony'],
                    callback: (value) => send('Harmony', value),
                  )
                

  
                ],
              ),
              const SizedBox(height: 20),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Increment(
                    title: 'Human Player Attempts',
                    value: widget.inputs['HumanAttempts'],
                    callback: (value) => send('HumanAttempts', value),
                  ),
                  SizedBox(width: 25),
                  Increment(
                    title: 'Human Player Successes',
                    value: widget.inputs['HumanPlayerSuccess'],
                    callback: (value) => send('HumanPlayerSuccess', value),
                  ),
                  SizedBox(width: 25),
                  Increment(
                    title: 'Ranking Points',
                    value: widget.inputs['RP'],
                    callback: (value) => send('RP', value),
                  ),
                  SizedBox(width: 25),
                  Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 3), 
                    borderRadius: BorderRadius.circular(9.0)),
                    child:  Increment(
                        title: 'NoteInTrap',
                        value: widget.inputs['NoteInTrap'],
                        callback: (value) => send('NoteInTrap', value)
                      )
                    ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 3), 
                    borderRadius: BorderRadius.circular(9.0)),
                    child: SizedBox(width: 530, height: 175, 
                      child: TextInput(
                        title: 'Comments', 
                        callback: (value) => send('Comments', value), 
                        initial: widget.inputs['Comments'])
                        )
                      ),
              
                  SizedBox(width: 25),
                ],
              )
          
                
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


