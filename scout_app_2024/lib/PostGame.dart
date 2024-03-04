import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:qr_flutter/qr_flutter.dart';
import "qr_code.dart";

typedef StringCallback = void Function(String value);

class PostGame extends StatelessWidget {
  const PostGame({Key? key, required this.inputs, required this.callback})
      : super(key: key);

  final inputs;
  final callback;

  @override
  Widget build(BuildContext context) {
    QRCodeGenerator qrCodeGenerator = QRCodeGenerator(inputs);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 45,
            width: 200,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Apply border radius
                border: Border.all(
                  color: const Color.fromARGB(255, 19, 14, 106), // Change the color to your desired color
                  width: 4, // Set border thickness
                ),
                color: const Color.fromARGB(255, 61, 60, 60), // Set background color of the box
              ),
              child: Text(
                inputs['team']!= '' ? inputs['team']: 'No Team',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  // color: Colors.black, // Change the color to your desired color
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: QrImageView(
              data: qrCodeGenerator.generateQRCode(),
              version: QrVersions.auto,
              size: 300,
            ),
          ),
          const SizedBox(height: 10), // Add padding between QR code and button
          SizedBox(
            height: 35,
            width: 400,
            child: MaterialButton(
              onPressed: () {
                showDialog(context: context,
                builder: (context) => AlertDialog(
                  title: const Text("DID YOU GET IT SCANNED?"),
                  
                
                actions:[
                  TextButton(
                    child: const Text("NO"),
                    onPressed:() =>  Navigator.pop(context)),
                  TextButton(
                    child: const Text("YES"),
                    onPressed:() =>  Phoenix.rebirth(context),)
                ]
                )
                );
                // Phoenix.rebirth(context);
            },
              color: const Color.fromARGB(255, 210, 82, 23),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Adjust the radius as needed
                side: const BorderSide(
                  color: Color.fromARGB(255, 19, 14, 106), // Change the color to your desired color
                  width: 5, // Adjust the thickness as needed
                ),
              ),
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // Change the color to your desired color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
