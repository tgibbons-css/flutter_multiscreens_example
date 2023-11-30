import 'package:flutter/material.dart';

import 'second_screen.dart';
import 'third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Function to update the counter value when receiving data from ThirdScreen
  void _returnedCounterFromThirdScreen(int newCounter) {
    setState(() {
      _counter = newCounter;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Code to go to the second screen
            ElevatedButton(
              child: const Text('Go to Second Screen'),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            // Code to pass the counter to the third screen
            ElevatedButton(
              child: const Text('Go to Third Screen'),
              onPressed: () {
                Navigator.push(context,
                  //MaterialPageRoute(builder: (context) => ThirdScreen(counter: _counter),
                  MaterialPageRoute(
                    builder: (context) => ThirdScreen(
                    counter: _counter,
                    onUpdateCounter: _returnedCounterFromThirdScreen,
                ),
                ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


