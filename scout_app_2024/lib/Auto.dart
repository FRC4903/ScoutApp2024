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
    double widthRatio = MediaQuery.of(context).size.width / initialScreenWidth;
    double heightRatio = 1;//MediaQuery.of(context).size.height / initialScreenHeight;

    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxHeight;
        double imageWidth = constraints.maxWidth / 2;

        return Stack(
          children: [
            SizedBox(
              width: widthRatio * initialScreenWidth / 2,
              height: heightRatio * initialScreenHeight,
              child: Image.asset(
                "images/2024Field.png",
                fit: BoxFit.fill,
              ),
            ),
Positioned(
  left: (initialScreenWidth / 2 + initialScreenHeight / 4) * widthRatio,
  top: (initialScreenHeight/2 - initialScreenHeight/4) * widthRatio,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Increment(
        title: 'Auto Amp Score',
        value: widget.inputs['AutoAmpScore'],
        callback: (value) => send('AutoAmpScore', value),
      ),
      SizedBox(height: 10), // Adding padding between elements
      Increment(
        title: 'Auto Speaker Score',
        value: widget.inputs['AutoSpeakerScore'],
        callback: (value) => send('AutoSpeakerScore', value),
      ),
      SizedBox(height: 10), // Adding padding between elements
      CheckboxInput(
        title: 'Taxi',
        initial: widget.inputs['Taxi'],
        callback: (value) => send('Taxi', value),
      ),
      SizedBox(height: 10), // Adding padding between elements
      CheckboxInput(
        title: 'Preloaded',
        initial: widget.inputs['PreLoaded'],
        callback: (value) => send('PreLoaded', value),
      ),
    ],
  ),
),

            Positioned(
              left: 40,
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
              left: 40,
              bottom: 70,
              child:             NumberSquare(
              number: 4,
              startPos: widget.inputs['StartPos'],
              callback: _handleNumberSquareCallback,
            ),),
Stack(
  alignment: Alignment.centerRight,
  children: [
    Positioned(
      top: 61 * heightRatio,
      left: 195 * widthRatio,
      child: Column(
        children: [
          OutlinedCheckbox(
            callback: (value) => send('closeNote0', value),
            initial: widget.inputs['closeNote0'],
          ),
          SizedBox(
            height: 43 * heightRatio,
          ),
          OutlinedCheckbox(
            callback: (value) => send('closeNote1', value),
            initial: widget.inputs['closeNote1'],
          ),
          SizedBox(
            height: 43 * heightRatio,
          ),
          OutlinedCheckbox(
            callback: (value) => send('closeNote2', value),
            initial: widget.inputs['closeNote2'],
          ),
        ],
      ),
    ),
    Positioned(
      top: 32 * heightRatio,
      left: 532 * widthRatio,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OutlinedCheckbox(
            callback: (value) => send('centerNote0', value),
            initial: widget.inputs['centerNote0'],
          ),
          SizedBox(
            height: 58 * heightRatio,
          ),
          OutlinedCheckbox(
            callback: (value) => send('centerNote1', value),
            initial: widget.inputs['centerNote1'],
          ),
          SizedBox(
            height: 58 * heightRatio,
          ),
          OutlinedCheckbox(
            callback: (value) => send('centerNote2', value),
            initial: widget.inputs['centerNote2'],
          ),
          SizedBox(
            height: 58 * heightRatio,
          ),
          OutlinedCheckbox(
            callback: (value) => send('centerNote3', value),
            initial: widget.inputs['centerNote3'],
          ),
          SizedBox(
            height: 58 * heightRatio,
          ),
          OutlinedCheckbox(
            callback: (value) => send('centerNote4', value),
            initial: widget.inputs['centerNote4'],
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

    // widget.callback({
    //   'autoAmpScore': autoAmpScore,
    //   'autoSpeakerScore': autoSpeakerScore,
    //   'taxi': taxi,
    //   'preloaded': preloaded,
    //   'startPos': startPos,
    //   'closeNote0': closeNoteStates[0],
    //   'closeNote1': closeNoteStates[1],
    //   'closeNote2': closeNoteStates[2],

    //   'centerNote0': centerNoteStates[0],
    //   'centerNote1': centerNoteStates[1],
    //   'centerNote2': centerNoteStates[2],
    //   'centerNote3': centerNoteStates[3],
    //   'centerNote4': centerNoteStates[4],

    // });
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
