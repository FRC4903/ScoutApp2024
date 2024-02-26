import 'package:flutter/material.dart';
import 'package:scout_app_2024/widgets.dart';

class Auto extends StatefulWidget {
  const Auto({Key? key, required this.inputs, required this.callback})
      : super(key: key);

  final inputs;
  final callback;

  @override
  State<Auto> createState() => _AutoState();
}

class _AutoState extends State<Auto> {
  int autoAmpScore = 0;
  int autoSpeakerScore = 0;
  bool taxi = false;
  bool preloaded = false;
  int startPos = 0;
  
  int activeNumber = 0;

  // Update the active number when a NumberSquare is tapped
  List<bool> closeNoteStates = List.generate(3, (index) => false);
  List<bool> centerNoteStates = List.generate(5, (index) => false);

  int closeNoteLocation = 1;
  int centerNoteLocation = 0;

  int closeNoteColumnDistance = 1;
  int centerNoteColumnDistance = 1;

  double verticalSpacing = 10.0;

  @override
  Widget build(BuildContext context) {
    double widthRatio = MediaQuery.of(context).size.width;// / initialScreenWidth;
    double heightRatio = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxHeight;
        double imageWidth = constraints.maxWidth / 2;

        return Stack(
          children: [
            SizedBox(
              width: widthRatio/2,
              height: heightRatio,
              child: Image.asset(
                "images/2024Field.png",
                fit: BoxFit.fill,
              ),
            ),
Positioned(
  left:  widthRatio * 0.65,
  top: heightRatio  * 0.02,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Increment(
        title: 'Auto Amp Score',
        value: widget.inputs['AutoAmpScore'],
        callback: (value) => send('AutoAmpScore', value),
      ),
      const SizedBox(height: 10), // Adding padding between elements
      Increment(
        title: 'Auto Speaker Score',
        value: widget.inputs['AutoSpeakerScore'],
        callback: (value) => send('AutoSpeakerScore', value),
      ),
      const SizedBox(height: 10), // Adding padding between elements
      CheckboxInput(
        title: 'Taxi',
        initial: widget.inputs['Taxi'],
        callback: (value) => send('Taxi', value),
      ),
      const SizedBox(height: 10), // Adding padding between elements
      CheckboxInput(
        title: 'Preloaded',
        initial: widget.inputs['PreLoaded'],
        callback: (value) => send('PreLoaded', value),
      ),
    ],
  ),
),

            Positioned(
              top: widthRatio * 0.015,
              left: widthRatio*0.036,
              child:  Column(
           
 children: [

            NumberSquare(
              number: 1,
              startPos: widget.inputs['StartPos'], // Pass the StartPos to NumberSquare
              callback: _handleNumberSquareCallback,
            ),
            NumberSquare(
              number: 2,
              startPos: widget.inputs['StartPos'],
              callback: _handleNumberSquareCallback,
            ),
            NumberSquare(
              number: 3,
              startPos: widget.inputs['StartPos'],
              callback: _handleNumberSquareCallback,
            ),
          ],
          )
            ),
            Positioned(
              bottom: widthRatio * 0.042,
              left: widthRatio*0.036,
              child:             NumberSquare(
              number: 4,
              startPos: widget.inputs['StartPos'],
              callback: _handleNumberSquareCallback,
            ),),
Stack(
  alignment: Alignment.centerRight,
  children: [
    Positioned(
      top: heightRatio * 0.073,
      left: widthRatio* 0.161,
      child: Column(
        children: [
          OutlinedCheckbox(
            callback: (value) => send('a', value),
            initial: widget.inputs['a'],
          ),
          SizedBox(
            height: heightRatio * 0.113 - heightRatio * 0.073,
          ),
          OutlinedCheckbox(
            callback: (value) => send('b', value),
            initial: widget.inputs['b'],
          ),
          SizedBox(
            height: heightRatio * 0.113 - heightRatio * 0.073,
          ),
          OutlinedCheckbox(
            callback: (value) => send('c', value),
            initial: widget.inputs['c'],
          ),
        ],
      ),
    ),
    Positioned(
      top: heightRatio * 0.032,
      left: widthRatio* 0.445,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OutlinedCheckbox(
            callback: (value) => send('v', value),
            initial: widget.inputs['v'],
          ),
          SizedBox(
            height: heightRatio * 0.090 -heightRatio * 0.032,
          ),
          OutlinedCheckbox(
            callback: (value) => send('w', value),
            initial: widget.inputs['w'],
          ),
          SizedBox(
            height: heightRatio * 0.090 -heightRatio * 0.032,
          ),
          OutlinedCheckbox(
            callback: (value) => send('x', value),
            initial: widget.inputs['x'],
          ),
          SizedBox(
            height: heightRatio * 0.090 -heightRatio * 0.032,
          ),
          OutlinedCheckbox(
            callback: (value) => send('y', value),
            initial: widget.inputs['y'],
          ),
          SizedBox(
            height: heightRatio * 0.090 -heightRatio * 0.032,
          ),
          OutlinedCheckbox(
            callback: (value) => send('z', value),
            initial: widget.inputs['z'],
          ),
        ],
      ),
    ),
  ],
),
          ],
        );
      },
    );
  }

void _handleNumberSquareCallback(int selectedNumber) {
    setState(() {
      widget.inputs['StartPos'] = selectedNumber; // Update StartPos in inputs
    });
    widget.callback(widget.inputs);
  }
    void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }
}
