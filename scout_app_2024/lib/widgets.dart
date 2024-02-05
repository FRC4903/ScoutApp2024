import 'package:flutter/material.dart';

typedef IntCallback = void Function(int value);
typedef StringCallback = void Function(String value);
typedef BoolCallback = void Function(bool value);

class OutlinedCheckbox extends StatefulWidget {
  const OutlinedCheckbox({
    Key? key,
    required this.callback,
    this.initial = false,
  }) : super(key: key);

  final BoolCallback callback;
  final bool initial;

  @override
  State<OutlinedCheckbox> createState() => OutlinedCheckboxState();
}

class OutlinedCheckboxState extends State<OutlinedCheckbox> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          value = !value;
        });
        widget.callback(value);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(9.0),
          color: value ? Colors.orange : Colors.transparent,
        ),
        child: Center(
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.options,
    required this.callback,
    required this.initialValue,
    required this.label
  }) : super(key: key);

  final List<String> options;
  final StringCallback callback;
  final String initialValue;
  final String label; // Add a label to describe the purpose of the dropdown

  @override
  State<CustomDropdown> createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialValue;
  }

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDropdown(context);
          },
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(9.0),
              color: Colors.transparent,
            ),
            child: Center(
              child: Text(
                selectedOption.isEmpty ? widget.label : selectedOption,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
void showDropdown(BuildContext context) {
  final RenderBox renderBox = context.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);

  // Filter out empty values
  final List<String> nonEmptyOptions = widget.options.where((option) => option.isNotEmpty).toList();

  final List<PopupMenuItem<String>> menuItems = nonEmptyOptions.map<PopupMenuItem<String>>((String option) {
    return PopupMenuItem<String>(
      value: option,
      child: Text(option),
    );
  }).toList();

  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(position.dx, position.dy + 50, position.dx + 150, position.dy + 200),
    items: <PopupMenuEntry<String>>[ // Explicitly specify the type here
      PopupMenuItem<String>(
        value: 'custom_dropdown_scroll_view',
        child: Container(
          height: 150, // Set the maximum height of the menu
          child: SingleChildScrollView(
            child: Column(
              children: menuItems,
            ),
          ),
        ),
      ),
    ],
  ).then((value) {
    if (value != null && value != 'custom_dropdown_header') {
      setState(() {
        selectedOption = value;
      });
      widget.callback(value);
    }
  });
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
  State<TextInput> createState() => TextInputState();
}

class TextInputState extends State<TextInput> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.initial);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 123,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter ${widget.title.toLowerCase()} here...',
              ),
              onChanged: (value) {
                widget.callback(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

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

