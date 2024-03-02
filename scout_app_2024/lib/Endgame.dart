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
  child: Padding(
    padding: const EdgeInsets.all(30.0),
    child: Stack(
      children: [
        Positioned( 
          // top:                  MediaQuery.of(context).size.height * 0.05, // Adjust the value as needed
// ,
                left: MediaQuery.of(context).size.width * 0.55, // Adjust the value as needed
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
                ),                const SizedBox(width: 5,),

                const SizedBox(width: 5),
                CheckboxInput(
                  title: 'Climb',
                  initial: widget.inputs['OnStageClimb'],
                  callback: (value) => send('OnStageClimb', value),
                )           ,     const SizedBox(width: 5,),

                ]
            ),            const SizedBox(width: 20,height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               CheckboxInput(
                  title: 'SpotLight',
                  initial: widget.inputs['SpotLight'],
                  callback: (value) => send('SpotLight', value),
                ),
                const SizedBox(width: 5,),
                CheckboxInput(
                  title: 'Won',
                  initial: widget.inputs['Won'],
                  callback: (value) => send('Won', value),
                ),                const SizedBox(width: 5,),

              ],
            ),            const SizedBox(width: 20,height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(width: 5),
                CheckboxInput(
                  title: 'Harmony',
                  initial: widget.inputs['Harmony'],
                  callback: (value) => send('Harmony', value),
                ),                const SizedBox(width: 5,),

                CheckboxInput(
                  title: 'Broke',
                  initial: widget.inputs['Broke'],
                  callback: (value) => send('Broke', value),
                ),                const SizedBox(width: 5,),


              ],
            ),            const SizedBox(width: 20,height: 5),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Increment(
                  title: 'Ranking Points',
                  value: widget.inputs['RP'],
                  callback: (value) => send('RP', value),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: Increment(
                    title: 'Trap',
                    value: widget.inputs['NoteInTrap'],
                    callback: (value) => send('NoteInTrap', value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextInput(
              title: 'TeleOp Comments',
              initial: widget.inputs["TeleOpComments"] ?? "",
              callback: (value) => send('TeleOpComments', value),
            ),
            TextInput(
              title: 'Auto Comments',
              initial: widget.inputs['AutoComments'] ?? "",
              callback: (value) => send('AutoComments', value),
            ),
            TextInput(
              title: 'Reliability Comments',
              initial: widget.inputs['ReliabilityComments'] ?? "",
              callback: (value) => send('ReliabilityComments', value),
            ),
          ],
        ),
      ],
    ),
  ),
);

  }

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }

}


