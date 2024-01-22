import 'package:flutter/material.dart';

typedef StringCallback = void Function(String value);

class PostGame extends StatelessWidget {
  const PostGame({Key? key, required this.inputs, required this.callback}) : super(key: key);

  final dynamic inputs; // You might want to change the type of inputs based on your needs
  final StringCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'PostGame',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        TextInput(
          title: 'Enter PostGame Text',
          callback: (text) {
            // Handle the entered text
            callback(text);
          },
          initial: '',
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Perform post-game action with inputs
            callback(inputs);
          },
          child: const Text('Post Game Action'),
        ),
      ],
    );
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
            width: 300,
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
                hintText: 'Enter text here...',
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
