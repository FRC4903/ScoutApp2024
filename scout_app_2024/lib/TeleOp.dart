
import 'package:flutter/material.dart';
import 'widgets.dart';

class TeloOp extends StatefulWidget {
  const TeloOp({Key? key, required this.inputs, required this.callback}) : super(key: key);

  final inputs;
  final callback;

  @override
  _TeloOpState createState() => _TeloOpState();
}

class _TeloOpState extends State<TeloOp> {
  @override
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckboxInput(
                    title: 'Ground Pickup',
                    initial: widget.inputs['GroundPickup'],
                    callback: (value) => send('GroundPickup', value),
                  ),
                  const SizedBox(width: 20),
                  CheckboxInput(
                    title: 'Source Pickup',
                    initial: widget.inputs['SourcePickup'],
                    callback: (value) => send('SourcePickup', value),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                                    CheckboxInput(
                    title: 'Defended',
                    initial: widget.inputs['Defended'],
                    callback: (value) => send('Defended', value),
                  ),              const SizedBox(width: 15),
                  const SizedBox(width: 15),

                  CheckboxInput(
                    title: 'Under Stage',
                    initial: widget.inputs['UnderStage'],
                    callback: (value) => send('UnderStage', value),
                  ),              const SizedBox(width: 15),

                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SliderWidget(
                    max: 3, 
                    divison: 3, 
                    sliderValues: const ["No Defense", "Bad Defense", "Average Defense", "Good Defense"], 
                    initialValue: widget.inputs['DefenseScale'],
                    callback: (value) => send('DefenseScale', value))],
               
                  ),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Increment(
                    title: 'Amped Speaker',
                    value: widget.inputs['ScoringAmplifiedSpeaker'],
                    callback: (value) => send('ScoringAmplifiedSpeaker', value),
                  ),
                  Increment(
                    title: 'Unamped Speaker',
                    value: widget.inputs['ScoringUnAmpedSpeaker'],
                    callback: (value) => send('ScoringUnAmpedSpeaker', value),
                  ),
                    Increment(
                    title: 'Speaker Misses',
                    value: widget.inputs['SpeakerMisses'],
                    callback: (value) => send('SpeakerMisses', value),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Increment(
                    title: 'Amp Score',
                    value: widget.inputs['ScoringAmp'],
                    callback: (value) => send('ScoringAmp', value),
                  ),

                  Increment(
                    title: 'Amp Misses',
                    value: widget.inputs['AmpMisses'],
                    callback: (value) => send('AmpMisses', value),
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
