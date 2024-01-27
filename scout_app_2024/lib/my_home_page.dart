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
    'ScouterName': 0,
    'MatchNumber': 0,
    'StartingLocation': '',
    'Taxi': false,
    'AutoGroundPickup': 0,
    'AutoSourcePickup': 0,
    'AutoSpeakerScore': 0,
    'AutoAmpScore': 0,
    'Defends': false,
    'Defended': false,
    'GroundPickup': false,
    'SourcePickup': false,
    'ShotsFired': 0,
    'ShotsScored': 0,
    'ChainFit': false,
    'ScoringAmplifiedSpeaker': 0,
    'ScoringUnAmpedSpeaker': 0,
    'ScoringAmp': 0,
    'EndgamePark': false,
    'OnstageClimb': false,
    'Harmony': false,
    'Trap': false,
    'HumanPlayerSuccess': 0,
    'RP': 0,
    'Won': false,
    'CommentsAuto': '',
    'CommentsTeleop': '',
    'CommentsEndgame': ''
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Slider App'),
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