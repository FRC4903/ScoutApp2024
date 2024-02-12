import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import "qr_code.dart";

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
          
          const SizedBox(height: 24),



          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: QrImageView(
              data: qrCodeGenerator.generateQRCode(),
              version: QrVersions.auto,
              size: 300,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

