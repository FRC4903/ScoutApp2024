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
  var inputs = {};
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
        children:[
          PreGame(
                  inputs: inputs,
                  callback: (value) => setState(() => inputs = value)),
          Auto(   inputs: inputs,
                  callback: (value) => setState(() => inputs = value)),
          TeleOp( inputs: inputs,
                  callback: (value) => setState(() => inputs = value)),
          Endgame(inputs: inputs,
                  callback: (value) => setState(() => inputs = value)),
          PostGame(inputs: inputs,
                  callback: (value) => setState(() => inputs = value))
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
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Auto',
          ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'TeleOp',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'EndGame',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'PostGame',
          ),
        ],
      ),
    );
  }
}
