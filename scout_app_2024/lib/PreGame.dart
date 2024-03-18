import 'package:flutter/material.dart';
import 'package:scout_app_2024/widgets.dart';
class PreGame extends StatefulWidget {
  const PreGame({Key? key, required this.inputs, required this.callback}) : super(key: key);

  final inputs;
  final callback;

  @override
  _PreGameState createState() => _PreGameState();
}

class _PreGameState extends State<PreGame> {
  @override
  
  Widget build(BuildContext context) {
        double initialScreenWidth = MediaQuery.of(context).size.width;
    double initialScreenHeight = MediaQuery.of(context).size.height;

    // Print the initial height and width of the screen
    // print('Initial Screen Width: $initialScreenWidth');
    // print('Initial Screen Height: $initialScreenHeight');
    return SafeArea(
      
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center, // Center everything horizontally
            children: [
              TextInput(
                title: 'Scouter Name',
                callback: (value) => send('ScouterName', value),
                initial: widget.inputs['ScouterName'],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: CustomDropdown(
                      options: const ['772', '1360', '2609', '2702', '3683', '3739', '3756', '4476', '4617', '4678', '4903', '4917', '5024', '5912', '6070', '6162', '6725', '6875', '6978', '6992', '7022', '7509', '7722', '8089', '8765', '9062', '9525', '9562', '9659', '9663','Ex1', 'Ex2', 'Ex3', 'Ex4', 'Ex5'],
                      callback: (value) => send('team', value),
                      initialValue: widget.inputs['team'].toString(),
                      label: "Team",
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    child: CustomDropdown(
                      options: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100', '101', '102', '103', '104', '105', '106', '107', '108', '109', '110', '111', '112', '113', '114', '115', '116', '117', '118', '119','120'],
                      callback: (value) => send('MatchNumber', value),
                      initialValue: widget.inputs['MatchNumber'].toString(),
                      label: "Match",
                    ),
                  ),          
                ],
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }
}