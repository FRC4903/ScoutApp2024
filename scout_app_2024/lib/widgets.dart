import 'package:flutter/material.dart';

typedef IntCallback = void Function(int value);
typedef StringCallback = void Function(String value);
typedef BoolCallback = void Function(bool value);

class Increment extends StatefulWidget {
  const Increment({
    Key? key,
    required this.title,
    required this.callback,
    this.value = 0,
  }) : super(key: key);

  final String title;
  final IntCallback callback;
  final int value;

  @override
  State<Increment> createState() => IncrementState();
}

class IncrementState extends State<Increment> {
  int value = 0;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(144, 255, 255, 255),
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
      ),
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: decrement,
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 40,
                  ),
                ),
                Text(
                  '$value',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                IconButton(
                  onPressed: increment,
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void increment() {
    setState(() {
      value++;
    });
    widget.callback(value);
  }

  void decrement() {
    if (value > 0) {
      setState(() {
        value--;
      });
    }
    widget.callback(value);
  }
}

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.title,
    required this.callback,
    this.initial = '',
  }) : super(key: key);

  final String title;
  final StringCallback callback;
  final String initial;

  @override
  State<TextInput> createState() => TextState();
}

class TextState extends State<TextInput> {
  String value = '';
  late TextEditingController textController;
  late FocusNode focus;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.initial);
    focus = FocusNode();
    focus.addListener(() {
      if (!focus.hasFocus) {
        setText();
      }
    });
  }

  @override
  void dispose() {
    focus.removeListener(() {});
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 500,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(144, 255, 255, 255),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: TextField(
              focusNode: focus,
              controller: textController,
              style: const TextStyle(height: 5),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: widget.title,
                hintText: 'Enter comments here...',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setText() {
    setState(() {
      value = textController.text;
    });
    widget.callback(value);
  }
}

<<<<<<< Updated upstream
class CheckboxInput extends StatefulWidget {
  const CheckboxInput({
    Key? key,
    required this.title,
    required this.callback,
    this.initial = false,
  }) : super(key: key);

  final String title;
  final BoolCallback callback;
  final bool initial;

  @override
  State<CheckboxInput> createState() => CheckboxInputState();
}

class CheckboxInputState extends State<CheckboxInput> {
  late bool value;

  @override
  State<CheckboxListTileExample> createState() => _CheckboxListTileExampleState();
}

class _CheckboxListTileExampleState extends State<CheckboxListTileExample> {
  bool checkboxValue1 = true;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          value: checkboxValue1,
          onChanged: (bool? value) {
            setState(() {
              checkboxValue1 = value!;
              print(checkboxValue1);
              
            });
          },
          title: Text(widget.headerName),
          
        ),
        const Divider(height: 0)
      ],
    );
  }
}
=======
>>>>>>> Stashed changes
