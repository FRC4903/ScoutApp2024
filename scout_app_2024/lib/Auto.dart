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
    double heightRatio = MediaQuery.of(context).size.height / initialScreenHeight;

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
              left: (initialScreenWidth / 2 + initialScreenHeight / 6) * widthRatio,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Increment(
                    title: 'Auto Amp Score',
                    value: widget.inputs['AutoAmpScore'],
                    callback: (value) => send('AutoAmpScore', value),
                  ),
                  Increment(
                    title: 'Auto Speaker Score',
                    value: widget.inputs['AutoSpeakerScore'],
                    callback: (value) => send('AutoSpeakerScore', value),
                  ),
                  CheckboxInput(
                    title: 'Taxi',
                    initial: widget.inputs['Taxi'],
                    callback: (value) => send('Taxi', value),
                  ),
                  CheckboxInput(
                    title: 'Preloaded',
                    initial: widget.inputs['PreLoaded'],
                    callback: (value) => send('PreLoaded', value),
                  ),
                ],
              ),
            ),
            Row(
              children: [
    NumberSquare(
          number: 1,
          active: activeNumber == 1, // Pass whether this number is active
          callback: (value) => send('StartPos', value),
        ),
        NumberSquare(
          number: 2,
          active: activeNumber == 2,
          callback:  (value) => send('StartPos', value),
        ),
        NumberSquare(
          number: 3,
          active: activeNumber == 3,
          callback:  (value) => send('StartPos', value),
        ),
        NumberSquare(
          number: 4,
          active: activeNumber == 4,
          callback:  (value) => send('StartPos', value),
        ),
              ],
            ),
            // Stack(
            //   alignment: Alignment.centerRight,
            //   children: [
            //     Positioned(
            //       top: 65 * heightRatio,
            //       left: 210 * widthRatio,
            //       child: Column(
            //         children: List.generate(
            //           3,
            //           (index) => Column(
            //             children: [
            //               OutlinedCheckbox(
            //                 callback: (value) {
            //                   setState(() {
            //                     closeNoteStates[index] = value;
            //                   });
            //                   updateInputs();
            //                 },
            //                 initial: closeNoteStates[index],
            //               ),
            //               SizedBox(
            //                 height: 47 * heightRatio,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       top: 35 * heightRatio,
            //       left: 570 * widthRatio,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: List.generate(
            //           5,
            //           (index) => Column(
            //             children: [
            //               OutlinedCheckbox(
            //                 callback: (value) {
            //                   setState(() {
            //                     centerNoteStates[index] = value;
            //                   });
            //                   updateInputs();
            //                 },
            //                 initial: centerNoteStates[index],
            //               ),
            //               SizedBox(
            //                 height: 62 * heightRatio,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
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

    void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }
}
