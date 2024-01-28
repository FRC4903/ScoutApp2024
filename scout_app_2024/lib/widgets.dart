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
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decrement,
                icon: Icon(
                  Icons.remove_circle_outline,
                  size: 40,
                ),
              ),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: increment,
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
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
      width: 500,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: TextField(
        focusNode: focus,
        controller: textController,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.title,
          hintText: 'Enter comments here...',
        ),
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
  void initState() {
    super.initState();
    value = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue!;
            });
            widget.callback(value);
          },
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
