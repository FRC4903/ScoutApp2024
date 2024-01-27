import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator {
  final Map<String, dynamic> inputs;

  QRCodeGenerator(this.inputs);

  String generateQRCode() {
    return _buildQRData();
  }

  String _buildQRData() {
    return '''
      Team: ${inputs['team']}
      TeamNumber: ${inputs['TeamNumber']}
      ScouterName: ${inputs['ScouterName']}
      MatchNumber: ${inputs['MatchNumber']}
      StartingLocation: ${inputs['StartingLocation']}
      Taxi: ${inputs['Taxi']}
      AutoPickup: ${inputs['AutoPickup']}
      AutoScore: ${inputs['AutoScore']}
      GroundPickup: ${inputs['GroundPickup']}
      SourcePickup: ${inputs['SourcePickup']}
      SpeakerScore: ${inputs['SpeakerScore']}
      AmpScore: ${inputs['AmpScore']}
      Defends: ${inputs['Defends']}
      Defended: ${inputs['Defended']}
      ShotsFired: ${inputs['ShotsFired']}
      ShotsScored: ${inputs['ShotsScored']}
      ChainFit: ${inputs['ChainFit']}
      ScoringAmplifiedSpeaker: ${inputs['ScoringAmplifiedSpeaker']}
      ScoringAmplifiedAmp: ${inputs['ScoringAmplifiedAmp']}
      EndgamePark: ${inputs['EndgamePark']}
      OnstageClimb: ${inputs['OnstageClimb']}
      Harmony: ${inputs['Harmony']}
      Trap: ${inputs['Trap']}
      HumanPlayerSuccess: ${inputs['HumanPlayerSuccess']}
      RP: ${inputs['RP']}
      Won: ${inputs['Won']}
      CommentsAuto: ${inputs['CommentsAuto']}
      CommentsTeleop: ${inputs['CommentsTeleop']}
      CommentsEndgame: ${inputs['CommentsEndgame']}
    ''';
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
