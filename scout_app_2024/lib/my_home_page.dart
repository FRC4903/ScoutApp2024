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
          MyStatefulWidget(
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
<<<<<<< Updated upstream
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
=======
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // Define the default text style
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(
                  color: const Color.fromARGB(255, 255, 0, 0), // Default text color
                ),
              ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'PreGame',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Auto',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Tele Op',
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
>>>>>>> Stashed changes
      ),
    );
  }
}