import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  // Initial counter value received from FirstScreen
  final int counter;

  // Callback function to update the counter value in FirstScreen
  final Function(int) onUpdateCounter;

  // Constructor to receive the initial counter value and callback function
  ThirdScreen({required this.counter, required this.onUpdateCounter});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  // Counter variable for the second screen
  late int _counter;

  @override
  void initState() {
    super.initState();
    // Initialize the counter with the value received from FirstScreen
    _counter = widget.counter;
  }

  // Function to increment the counter and update it in FirstScreen
  void _incrementCounter() {
    setState(() {
      _counter++;
      // Update the counter value in HomeScreen using the callback function
      widget.onUpdateCounter(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        color: Colors.amberAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is a stateful widget. The counter is passed in from the home screen using'),
              Text('MaterialPageRoute(builder: (context) => ThirdScreen(counter: _counter)'),
              SizedBox(height: 20),
              Text('A callback funtion is also provided to update data back in the HomeScreen'),
              Text('onUpdateCounter: _returnedCounterFromThirdScreen,'),
              SizedBox(height: 20),
              Text('Counter on Third Screen: $_counter'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the first screen when the button is pressed
                  Navigator.pop(context);
                },
                child: Text('Close Third Screen'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}