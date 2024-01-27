import 'package:flutter/material.dart';
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
        ],
      ),
    );
  }
}
