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

  List<bool> closeNoteStates = List.generate(3, (index) => false);
  List<bool> centerNoteStates = List.generate(5, (index) => false);

  int closeNoteLocation =1; // Location for the first note in 'close' list
  int centerNoteLocation = 0; // Location for the first note in 'center' list

  int closeNoteColumnDistance = 1; // Column distance for 'close' notes
  int centerNoteColumnDistance = 1; // Column distance for 'center' notes

  double verticalSpacing = 10.0; // Adjust the vertical spacing between checkboxes

// ... (previous code remains unchanged)

@override
Widget build(BuildContext context) {
  double imageHeight = MediaQuery.of(context).size.height / 2;
  double imageWidth = MediaQuery.of(context).size.width / 2;

  return Stack(
    children: [
      // Container with fixed aspect ratio for the main image
      Container(
        width: imageWidth,
        height: double.infinity,
        child: Image.asset(
          "images/2024Field.png",
          fit: BoxFit.cover,
        ),
      ),
      // Stack for counters, checkboxes, and note controls
      Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end, // Align to the left
            children: [
              Increment(
                title: 'Auto Amp Score',
                callback: (value) {
                  setState(() {
                    autoAmpScore = value;
                  });
                  widget.callback(autoAmpScore, autoSpeakerScore, taxi, preloaded);
                },
              ),
              Increment(
                title: 'Auto Speaker Score',
                callback: (value) {
                  setState(() {
                    autoSpeakerScore = value;
                  });
                  widget.callback(autoAmpScore, autoSpeakerScore, taxi, preloaded);
                },
              ),
              CheckboxInput(
                title: 'Taxi',
                callback: (value) {
                  setState(() {
                    taxi = value;
                  });
                  widget.callback(autoAmpScore, autoSpeakerScore, taxi, preloaded);
                },
                initial: taxi,
              ),
              CheckboxInput(
                title: 'Preloaded',
                callback: (value) {
                  setState(() {
                    preloaded = value;
                  });
                  widget.callback(autoAmpScore, autoSpeakerScore, taxi, preloaded);
                },
                initial: preloaded,
              ),
            ],
          ),
          // Positioned for 'close' notes
          Positioned(
            top: 65, // Adjust the value for vertical spacing
            left: 210, // Align with the left side of the image
            child: Column(
              children: List.generate(
                3,
                (index) => Column(
                  children: [
                    OutlinedCheckbox(
                      callback: (value) {
                        setState(() {
                          closeNoteStates[index] = value;
                        });
                        // Trigger actions for the specific note here
                      },
                      initial: closeNoteStates[index],
                    ),
                    SizedBox(height: 47), // Adjust vertical spacing
                  ],
                ),
              ),
            ),
          ),
          // Positioned for 'center' notes
          Positioned(
            top:35, // Adjust the value for vertical spacing
            left: 570, // Adjust the left position
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                5,
                (index) => Column(
                  children: [
                    OutlinedCheckbox(
                      callback: (value) {
                        setState(() {
                          centerNoteStates[index] = value;
                        });
                        // Trigger actions for the specific note here
                      },
                      initial: centerNoteStates[index],
                    ),
                    SizedBox(height: 62), // Adjust vertical spacing
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
}