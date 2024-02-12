import 'package:flutter/material.dart';
import 'my_app.dart';
void main() {
  //test
  runApp(const MyApp());
}
// import 'package:flutter/material.dart';

// typedef IntCallback = void Function(int value);

// class NumberSelectionWidget extends StatefulWidget {
//   final IntCallback callback;

//   NumberSelectionWidget({required this.callback});

//   @override
//   _NumberSelectionWidgetState createState() => _NumberSelectionWidgetState();
// }

// class _NumberSelectionWidgetState extends State<NumberSelectionWidget> {
//   int? _selectedNumber;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(5, (index) {
//         int number = index + 1;
//         return NumberButton(
//           number: number,
//           isSelected: _selectedNumber == number,
//           onPressed: () {
//             setState(() {
//               _selectedNumber = number;
//               widget.callback(number);
//             });
//           },
//         );
//       }),
//     );
//   }
// }

// class NumberButton extends StatelessWidget {
//   final int number;
//   final bool isSelected;
//   final VoidCallback onPressed;

//   NumberButton({required this.number, required this.isSelected, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected ? Colors.orange : null,
//       ),
//       child: Text(
//         '$number',
//         style: TextStyle(
//           color: isSelected ? Colors.white : Colors.black,
//           fontSize: 20,
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text('Number Selection')),
//       body: Center(
//         child: NumberSelectionWidget(
//           callback: (value) {
//             print('Selected value: $value');
//           },
//         ),
//       ),
//     ),
//   ));
// }
