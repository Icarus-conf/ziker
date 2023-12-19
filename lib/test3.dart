import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create a list of texts for each item
  final List<String> texts = [
    "This is the first item",
    "This is the second item",
    "This is the third item",
    "This is the fourth item",
    "This is the fifth item",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Counter Example"),
        ),
        body: ListView.builder(
          // Set the length of the list
          itemCount: texts.length,
          // Return a CounterItem widget for each item
          itemBuilder: (context, index) {
            return CounterItem(
              // Pass the text and the initial counter value
              text: texts[index],
              initialCount: index + 1,
            );
          },
        ),
      ),
    );
  }
}

class CounterItem extends StatefulWidget {
  // The text for the item
  final String text;
  // The initial counter value for the item
  final int initialCount;

  // Constructor to initialize the fields
  CounterItem({required this.text, required this.initialCount});

  @override
  _CounterItemState createState() => _CounterItemState();
}

class _CounterItemState extends State<CounterItem> {
  // A variable to store the current counter value
  int currentCount = 0;

  @override
  void initState() {
    super.initState();
    // Set the current counter value to the initial value
    currentCount = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // Use a Column to arrange the text and the buttons vertically
      child: Column(
        children: [
          // Display the text inside the card
          Text(widget.text),
          // Use a Row to display the two buttons horizontally
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Use ElevatedButton widgets to create the buttons
              ElevatedButton(
                onPressed: () {
                  // Use setState to decrement the counter and update the UI
                  setState(() {
                    currentCount--;
                  });
                },
                child: Text("Decrease"),
              ),
              // Display the current counter value
              Text(currentCount.toString()),
              ElevatedButton(
                onPressed: () {
                  // Use setState to increment the counter and update the UI
                  setState(() {
                    currentCount++;
                  });
                },
                child: Text("Increase"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
