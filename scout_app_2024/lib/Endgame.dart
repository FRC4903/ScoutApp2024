import 'package:flutter/material.dart';
import 'widgets.dart';

class Endgame extends StatefulWidget {
  const Endgame({super.key, required this.inputs, required this.callback});
  final inputs;
  final callback;
  @override
  _Endgame createState() => _Endgame();
}

class _Endgame extends State<Endgame> {
  @override
  Widget build(BuildContext context) {
    double initialScreenWidth = MediaQuery.of(context).size.width;
    double initialScreenHeight = MediaQuery.of(context).size.height;
    const double boxWid = 160;
    const double boxHgt = 9;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Positioned(
              left: initialScreenWidth / 1.66,
              top: initialScreenHeight / 9,

                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckboxInput(
                            title: 'SpotLight',
                            initial: widget.inputs['SpotLight'],
                            callback: (value) => send('SpotLight', value),
                          ),
                          const SizedBox(
                            height: boxHgt,
                            width: boxWid,
                          ),
                          CheckboxInput(
                            title: 'Harmony',
                            initial: widget.inputs['Harmony'],
                            callback: (value) => send('Harmony', value),
                          ),
                          const SizedBox(
                            height: boxHgt,
                            width: boxWid,
                          ),
                          CheckboxInput(
                            title: 'Broke',
                            initial: widget.inputs['Broke'],
                            callback: (value) => send('Broke', value),
                          ),
                          const SizedBox(
                            height: boxHgt,
                            width: boxWid,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckboxInput(
                            title: 'Parked',
                            initial: widget.inputs['Parked'],
                            callback: (value) => send('Parked', value),
                          ),
                          const SizedBox(
                            height: boxHgt,
                            width: boxWid,
                          ),
                          const SizedBox(width: 5),
                          CheckboxInput(
                            title: 'Climb',
                            initial: widget.inputs['OnStageClimb'],
                            callback: (value) => send('OnStageClimb', value),
                          ),
                          const SizedBox(
                            height: boxHgt,
                            width: boxWid,
                          ),
                        ],
                      )
                    ],
                  )
            ),
            Positioned(
              left: initialScreenWidth / 2 + initialScreenWidth / 12,
              bottom: initialScreenHeight / 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                SizedBox(height: 10),
                TextInput(
                  title: 'Auto Comments',
                  initial: widget.inputs['AutoComments'] ?? "",
                  callback: (value) => send('AutoComments', value),
                ),
                SizedBox(height: 10),
                TextInput(
                  title: 'General Comments',
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
