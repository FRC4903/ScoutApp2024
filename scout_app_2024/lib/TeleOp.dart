import 'package:flutter/material.dart';
import 'widgets.dart';
import 'dart:developer' as developer;


  class TeloOp extends StatefulWidget {

      const TeloOp({super.key, required this.inputs, required this.callback});

      final inputs;
      final callback;
          
      @override
      _TeloOpState createState() => _TeloOpState();
    }
    
    class _TeloOpState extends State<TeloOp> {
       @override
       bool groundPickup=false;
       bool sourcePickup=false;
       bool wereDefended=false;
       bool didDefending=false;
       bool nottipsy=false;
       int speaker=0;
       int amp=0;
       int accuracy=0;
       int total=0;
       
       


  Widget build(BuildContext context) {
    print("Ground Pickup: "+ toString(widget.inputs['GroundPickup']));
    print("Source Pickup: "+ toString(widget.inputs['SourcePickup']));
    print("Defense: "+ toString(widget.inputs['Defense']));
    print("Defended: "+ toString(widget.inputs['Defended']));
    print(widget.inputs['SpeakerScore']);
    return SafeArea(
        child: Center(
            child: ListView(children: [
              SizedBox(height: 10),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Ground Pickup:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: widget.inputs['GroundPickup'],
                      onChanged: (bool? value) {
                        send('GroundPickup', value ?? false);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Source Pickup:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: widget.inputs['SourcePickup'],
                      onChanged: (bool? value) {
                        send('SourcePickup', value ?? false);
                      },
                    ),
                  ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Defense:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: widget.inputs['Defense'],
                      onChanged: (bool? value) {
                        send('Defense', value ?? false);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Defended:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: widget.inputs['Defended'],
                      onChanged: (bool? value) {
                        send('Defended', value ?? false);
                      },
                    ),
                  ),
                  
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(
                    'Score in Speaker:  ',
                    style: TextStyle(fontSize: 20),
                  ),
              Increment(
                  title: 'SpeakerScore',
                  value: widget.inputs['SpeakerScore'],
                  callback: (value) => send('SpeakerScore',
                      value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
            ]),
              ],
              
              ),
            
            ],
            
            ),
      // SizedBox(
      //   height: 422,
      //   child: Column(children: [
      //     const Center(
      //       child: Text(
      //         'Tele-op',
      //         style: TextStyle(
      //             fontSize: 25,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.white),
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //       Column(children: [
      //         TextInput(
      //             title: 'team number',
      //             initial: widget.inputs['team'],
      //             callback: (value) => send('team', value)),
      //         const SizedBox(height: 10),
      //         TextInput(
      //             title: 'match number',
      //             initial: widget.inputs['match'],
      //             callback: (value) => send('match', value)),
      //         const SizedBox(height: 10),
      //         TextInput(
      //             title: 'scouter',
      //             initial: widget.inputs['scouter'],
      //             callback: (value) => send('scouter', value)),
      //       ])
      //     ])
      //   ]),
      // ),
    ));
    }

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }
}

String toString(some) {
  return some ? "true" : "false";
}