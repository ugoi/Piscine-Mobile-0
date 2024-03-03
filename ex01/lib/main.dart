import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root widget of the app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EX01',
      theme: ThemeData(
        // App's theme with a black seed color and Material 3 enabled.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // Stateful widget to manage dynamic elements like the button press.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Logs button press action to console.
  static const String initialText =
      'A simple text'; // Constant inside the class
  static const String helloWorldText =
      'Hello World'; // Constant inside the class

  // State variable to hold the text.
  String _simpleText = initialText;

  // Toggle text on button press.
  void _logButtonPress() {
    print('Button pressed');
    setState(() {
      _simpleText = _simpleText == initialText ? helloWorldText : initialText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Builds UI elements, updating on state changes.
    return Scaffold(
      body: Center(
        // Centers content vertically and horizontally.
        child: Column(
          // Arranges text and button vertically and centers them.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_simpleText),
            ElevatedButton(
                onPressed: _logButtonPress,
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: const Text('Press me')),
          ],
        ),
      ),
    );
  }
}
