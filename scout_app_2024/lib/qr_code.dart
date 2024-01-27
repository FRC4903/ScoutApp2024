import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator {
  final Map<String, dynamic> inputs;

  QRCodeGenerator(this.inputs);

  String generateQRCode() {
    // Concatenate the values without any separators
    String formattedData = inputs.values.map((value) => '$value').join(',');

    return formattedData;
  }
}

class QRCodeWidget extends StatelessWidget {
  final Map<String, dynamic> inputs;

  QRCodeWidget({required this.inputs});

  @override
  Widget build(BuildContext context) {
    QRCodeGenerator qrCodeGenerator = QRCodeGenerator(inputs);

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: QrImageView(
                data: qrCodeGenerator.generateQRCode(),
                version: QrVersions.auto,
                size: 400,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform any action when the button is pressed
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}