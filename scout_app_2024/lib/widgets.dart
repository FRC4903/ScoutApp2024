import 'package:flutter/material.dart';

typedef IntCallback = void Function(int value);
typedef StringCallback = void Function(String value);
typedef BoolCallback = void Function(bool value);
typedef DoubleCallback = void Function(double value);

const double initialScreenWidth = 1200;
const double initialScreenHeight = 600;

class NumberSquare extends StatefulWidget {
  const NumberSquare({
    Key? key,
    required this.callback,
    required this.number,
    required this.startPos,
    this.value = 0,
  }) : super(key: key);

  final IntCallback callback;
  final int number;
  final int startPos; // Add startPos parameter
  final int value;

  @override
  State<NumberSquare> createState() => _NumberSquareState();
}

class _NumberSquareState extends State<NumberSquare> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleSelection,
      child: Container(
        width: 90,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          color: _isSelected
              ? Colors.orange
              : const Color.fromARGB(112, 84, 215, 224),
        ),
        child: Center(
          child: Text(
            '${widget.number}',
            style: TextStyle(
              fontSize: 60,
              color: _isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.callback(widget.number); // Notify parent about the selected number
  }

  @override
  void initState() {
    super.initState();
    _isSelected = widget.number ==
        widget.startPos; // Check if the number matches the startPos
  }

  @override
  void didUpdateWidget(covariant NumberSquare oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isSelected = widget.number ==
        widget.startPos; // Update isSelected when widget is updated
  }
}

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
    double widthRatio =
        1; //MediaQuery.of(context).size.width / initialScreenWidth;
    double heightRatio =
        1; //MediaQuery.of(context).size.height / initialScreenHeight;

    return InkWell(
      onTap: _toggleValue, // Changed to _toggleValue
      child: Container(
        width: 50 * widthRatio,
        height: 50 * heightRatio,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(9.0),
          color: value ? Colors.orange : Colors.transparent,
        ),
        // child: Center(
        //   child: Icon(
        //     Icons.check,
        //     color: Colors.white,
        //   ),
        // ),
      ),
    );
  }

  void _toggleValue() {
    setState(() {
      value = !value;
    });
    widget.callback(value); // Notify parent about the updated value
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.options,
    required this.callback,
    required this.initialValue,
    required this.label,
  }) : super(key: key);

  final List<String> options;
  final Function(String) callback;
  final String initialValue;
  final String label;

  @override
  State<CustomDropdown> createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  late String selectedOption;
  late TextEditingController _searchController;
  late bool _isDropdownOpen;
  List<String> _filteredOptions = [];

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialValue;
    _searchController = TextEditingController();
    _isDropdownOpen = false;
    _filteredOptions = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isDropdownOpen = !_isDropdownOpen;
            });
          },
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 133, 124, 124),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(9.0),
              color: const Color.fromARGB(255, 128, 116, 116),
            ),
            child: Center(
              child: Text(
                selectedOption.isEmpty ? widget.label : selectedOption,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        if (_isDropdownOpen) ...[
          const SizedBox(height: 10),
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search...',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
              widget.callback(
                  selectedOption); // Send the entered text in the callback
              _onSearchTextChanged(
                  value); // Update the filtered options based on the search text
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: _filteredOptions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredOptions[index]),
                  onTap: () {
                    _onOptionSelected(_filteredOptions[index]);
                  },
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  void _onSearchTextChanged(String searchText) {
    setState(() {
      _filteredOptions = widget.options
          .where((option) =>
              option.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void _onOptionSelected(String option) {
    setState(() {
      selectedOption = option;
      _isDropdownOpen = false;
    });
    widget.callback(selectedOption);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
    double initialScreenWidth = MediaQuery.of(context).size.width;
    double initialScreenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: initialScreenWidth/2,
      height: initialScreenHeight/5,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 178, 178, 178),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   // child: Text(
          //   //   widget.title,
          //   //   style: const TextStyle(fontSize: 20, color: Colors.black),
          //   //   textAlign: TextAlign.center,
          //   // ),
          // ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: TextField(
              controller: textController,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintStyle: const TextStyle(color: Colors.black),
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
    double initialScreenWidth = MediaQuery.of(context).size.width;
    double initialScreenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: initialScreenWidth/3.3,
      height: initialScreenHeight/5,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 133, 124, 124),
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: 10),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          // const SizedBox(height: 10),
        ],
      ),
    );
  }

  void increment() {
    setState(() {
      value++;
    });
    widget.callback(value);
    if (widget.title == "Unamped Speaker") {}
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


class CheckboxInput extends StatefulWidget {
  const CheckboxInput({
    super.key,
    required this.title,
    required this.callback,
    this.initial = false,
  });

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
    double initialScreenWidth = MediaQuery.of(context).size.width;
    double initialScreenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
Transform.scale(
  scale: 1.4,child:
          Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue!;
            });
            widget.callback(value);
          },
        ),
),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 23 ),
        ),
      ],
    );
  }
}

class RedBlueToggle extends StatefulWidget {
  const RedBlueToggle({
    Key? key,
    required this.title,
    required this.callback,
    this.initial = false,
  }) : super(key: key);

  final String title;
  final BoolCallback callback;
  final bool initial;

  @override
  State<RedBlueToggle> createState() => _RedBlueToggleState();
}

class _RedBlueToggleState extends State<RedBlueToggle> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleValue,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value ? Colors.red : Colors.blue,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  void _toggleValue() {
    setState(() {
      value = !value;
    });
    widget.callback(value);
  }
}

class SliderWidget extends StatefulWidget {
  final double max;
  final int divison;
  final DoubleCallback callback;
  final double initialValue;
  List<String> sliderValues;

  SliderWidget(
      {super.key,
      required this.max,
      required this.divison,
      required this.sliderValues,
      required this.callback,
      required this.initialValue});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 10,
            activeTrackColor: const Color.fromARGB(255, 51, 153, 255),
            thumbColor: const Color.fromARGB(255, 0, 102, 255),
            valueIndicatorColor: Colors.black,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          child: Slider(
            value: _currentSliderValue,
            max: widget.max,
            divisions: widget.divison,
            label: widget.sliderValues[_currentSliderValue.toInt()],
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
              widget.callback(value);
            },
          ),
        ));
  }
}


