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
      title: 'Flutter EX00',
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
  void _logButtonPress() {
    print('Button pressed');
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
            const Text('A simple text'),
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
