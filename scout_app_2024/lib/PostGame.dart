
import 'package:qr_flutter/qr_flutter.dart';
import "qr_code.dart";
import 'widgets.dart';

typedef StringCallback = void Function(String value);

class PostGame extends StatelessWidget {
  const PostGame({Key? key, required this.inputs, required this.callback}) : super(key: key);

  final inputs;
  final callback;

  @override
  Widget build(BuildContext context) {
    QRCodeGenerator qrCodeGenerator = QRCodeGenerator(inputs);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'PostGame',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          // CheckboxListTileExample(),
          SizedBox(height: 16),
          Container(
            child: QrImageView(
              data: qrCodeGenerator.generateQRCode(),
              version: QrVersions.auto,
              size: 200,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // You can perform any action here
              // If you want to pass the QR code data to the callback, you can use:
              callback(qrCodeGenerator.generateQRCode());
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         CheckboxListTile(
//           value: checkboxValue1,
//           onChanged: (bool? value) {
//             setState(() {
//               checkboxValue1 = value!;
//             });
//           },
//           title: const Text('Var1'),
//           subtitle: const Text('Var1'),
//         ),
//         const Divider(height: 0),
//         CheckboxListTile(
//           value: checkboxValue2,
//           onChanged: (bool? value) {
//             setState(() {
//               checkboxValue2 = value!;
//             });
//           },
//           title: const Text('Var2'),
//           subtitle: const Text('Var2'),
//         ),
//         const Divider(height: 0),
//         CheckboxListTile(
//           value: checkboxValue3,
//           onChanged: (bool? value) {
//             setState(() {
//               checkboxValue3 = value!;
//             });
//           },
//           title: const Text('Var3'),
//           subtitle: const Text('Var3'),
//           isThreeLine: true,
//         ),
//         const Divider(height: 0),
//       ],
//     );
//   }
// }
