import 'package:flutter/material.dart';
import 'package:scout_app_2024/Auto.dart';
import 'package:scout_app_2024/PostGame.dart';
import 'package:scout_app_2024/PreGame.dart';
import 'TeleOp.dart';
import 'Endgame.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
var inputs = {
  'team': '',
  'ScouterName': "",
  'MatchNumber': "",
  'UnderStage' : false,  
  'Broke' : false,

  'autoAmpScore': 0,
  'autoSpeakerScore': 0,
  'StartPos': -1,
  'Taxi': false,
  'AutoGroundPickup': 0,
  'AutoSourcePickup': 0,
  'AutoSpeakerScore': 0,
  'AutoAmpScore': 0,

  'Defended': false,
  'DefenseScale': 0.0,
  'GroundPickup': false,
  'SourcePickup': false,
  'ChainFit': false,

  'SpeakerMisses': 0,
  'AmpMisses': 0,
  'ScoringAmplifiedSpeaker': 0,
  'ScoringUnAmpedSpeaker': 0,
  'ScoringAmp': 0,
  
  'EndgamePark': false,
  'OnstageClimb': false,

  'Harmony': false,
  'Trap': false,
  'SpotLight' : false,
  'Parked': false,
  'OnStageClimb': false,
  'NoteInTrap': 0,
  
  'a': false,
  'b': false,
  'c': false,
  'v': false,
  'w': false,
  'x': false,
  'y': false,
  'z': false,

  'ReliabilityComments': "",
  'AutoComments': "",
  'TeleOpComments': "",

};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('4903 Scout App'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          PreGame(
            inputs: inputs,
            callback:  (value) => setState(() => inputs = value)),
          Auto(
            inputs: inputs,
            callback: (value) => setState(() => inputs = value)),
          TeloOp(
            inputs: inputs,
            callback:  (value) => setState(() => inputs = value)),
          Endgame(
            inputs: inputs,
            callback:  (value) => setState(() => inputs = value)),
          PostGame(
            inputs: inputs,
            callback:  (value) => setState(() => inputs = value as Map<String, String>)), 
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'PreGame',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: 'Auto',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tele Op',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'EndGame',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2),
            label: 'PostGame',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}