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
                children: [
                  CheckboxInput(
                    title: 'Defends',
                    initial: widget.inputs['Defends'],
                    callback: (value) => send('Defends', value),
                  ),
                  const SizedBox(width: 20),
                  CheckboxInput(
                    title: 'Defended',
                    initial: widget.inputs['Defended'],
                    callback: (value) => send('Defended', value),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Increment(
                    title: 'ScoringAmplifiedSpeaker',
                    value: widget.inputs['ScoringAmplifiedSpeaker'],
                    callback: (value) => send('ScoringAmplifiedSpeaker', value),
                  ),
                  Increment(
                    title: 'ScoringUnAmpedSpeaker',
                    value: widget.inputs['ScoringUnAmpedSpeaker'],
                    callback: (value) => send('ScoringUnAmpedSpeaker', value),
                  ),
                  Increment(
                    title: 'ScoringAmp',
                    value: widget.inputs['ScoringAmp'],
                    callback: (value) => send('ScoringAmp', value),
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
