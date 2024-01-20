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
        children: const [
          PreGame(
            inputs: null,
            callback: null,
          ),
          Auto(
            inputs: null,
            callback: null,
          ),
          TeleOp(
            inputs: null,
            callback: null,
          ),
          Endgame(
            inputs: null,
            callback: null,
          ),
          PostGame(
            inputs: null,
            callback: null,
          ),
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
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Auto',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tele Op',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'EndGame',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'PostGame',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
