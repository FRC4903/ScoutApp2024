import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
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
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: QrImageView(
              data: qrCodeGenerator.generateQRCode(),
              version: QrVersions.auto,
              size: 300,
            ),
          ),
          SizedBox(
            height: 40,
            width: 400,
            child: MaterialButton(
              shape: const StadiumBorder(
                side: BorderSide(color: Colors.black),
              ),
            onPressed: () {
              Phoenix.rebirth(context);
            },
              child: const Text("Reset"))
            )
        ],
      ),
    );
  }
}

