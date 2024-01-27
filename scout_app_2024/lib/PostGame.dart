import 'package:flutter/material.dart';

typedef StringCallback = void Function(String value);

class PostGame extends StatelessWidget {
  const PostGame({Key? key, required this.inputs, required this.callback}) : super(key: key);

  final inputs;
  final callback;

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'PostGame',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          CheckboxListTileExample(),
        ],
      ),
    );
  }
}

class CheckboxListTileExample extends StatefulWidget {
  const CheckboxListTileExample({Key? key});

  @override
  State<CheckboxListTileExample> createState() => _CheckboxListTileExampleState();
}

class _CheckboxListTileExampleState extends State<CheckboxListTileExample> {
  bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      
      children: <Widget>[
        CheckboxListTile(
          value: checkboxValue1,
          onChanged: (bool? value) {
            setState(() {
              checkboxValue1 = value!;
            });
          },
          title: const Text('Var1'),
          subtitle: const Text('Var1'),
        ),
        const Divider(height: 0),
        CheckboxListTile(
          value: checkboxValue2,
          onChanged: (bool? value) {
            setState(() {
              checkboxValue2 = value!;
            });
          },
          title: const Text('Var2'),
          subtitle: const Text(
              'Var2'),
        ),
        const Divider(height: 0),
        CheckboxListTile(
          value: checkboxValue3,
          onChanged: (bool? value) {
            setState(() {
              checkboxValue3 = value!;
            });
          },
          title: const Text('Var3'),
          subtitle: const Text(
              "Var3"),
          isThreeLine: true,
        ),
        const Divider(height: 0),
      ],
    );
  }
}

