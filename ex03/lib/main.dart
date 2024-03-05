import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EX03',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '0';
  var answer = '0';

  // Array of button
  final List<String> buttons = [
    'AC',
    '+/-',
    '%',
    'C',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          //make it black
          // backgroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Colors.orange[700],
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        backgroundColor: Colors.black,
        body: OrientationBuilder(builder: (context, orientation) {
          // Check if the orientation is landscape
          bool isLandscape = orientation == Orientation.landscape;

          Widget content = Column(
            children: <Widget>[
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        //Right padding
                        padding: const EdgeInsets.only(right: 40),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userInput,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 40),
                        alignment: Alignment.centerRight,
                        child: Text(
                          answer,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      )
                    ]),
              ),
              Expanded(
                flex: 3,
                child: LayoutBuilder(builder: (context, constraints) {
                  // Calculate the childAspectRatio based on the GridView's actual height
                  var width = constraints.maxWidth;
                  var height = constraints.maxHeight;
                  var childAspectRatio = 1.0;
                  var rows = buttons.length / 4;
                  var columns = 4;
                  var needsAdjustment = (columns / rows) < (width / height);
                  if (needsAdjustment) {
                    childAspectRatio = width / (height * (columns / rows));
                  }

                  return GridView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // Clear Button
                        if (index == 0) {
                          return MyButton(
                            buttontapped: () {
                              print("button pressed : " + buttons[index]);
                              setState(() {
                                userInput = '0';
                                answer = '0';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.blue[50],
                            textColor: Colors.black,
                          );
                        }

                        // +/- button
                        else if (index == 1) {
                          return MyButton(
                            buttontapped: () {
                              print("button pressed : " + buttons[index]);
                              plusMinusPressed();
                            },
                            buttonText: buttons[index],
                            color: Colors.blue[50],
                            textColor: Colors.black,
                          );
                        }
                        // % Button
                        else if (index == 2) {
                          return MyButton(
                            buttontapped: () {
                              print("button pressed : " + buttons[index]);
                              buttonClick(buttons[index]);
                            },
                            buttonText: buttons[index],
                            color: Colors.blue[50],
                            textColor: Colors.black,
                          );
                        }
                        // Delete Button
                        else if (index == 3) {
                          return MyButton(
                            buttontapped: () {
                              print("button pressed : " + buttons[index]);
                              deletePressed();
                            },
                            buttonText: buttons[index],
                            color: Colors.blue[50],
                            textColor: Colors.black,
                          );
                        }
                        // Equal_to Button
                        else if (index == 18) {
                          return MyButton(
                            buttontapped: () {
                              print("button pressed : " + buttons[index]);
                              equalPressed();
                            },
                            buttonText: buttons[index],
                            color: Color(0xFFF57C00),
                            textColor: Colors.white,
                          );
                        }

                        // other buttons
                        else {
                          return MyButton(
                            buttontapped: () {
                              print("button pressed : " + buttons[index]);
                              buttonClick(buttons[index]);
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.blueAccent
                                : Colors.white,
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.black,
                          );
                        }
                      });
                }),
              ),
            ],
          );

          // If in landscape mode, wrap the content with SafeArea
          if (isLandscape) {
            return SafeArea(
              child: content,
              top: false,
              bottom: false,
              left: true,
              right: true,
            );
          } else {
            // In portrait mode, just return the content
            return content;
          }
        }));
  }

  // Sets the state of the userInput
  void buttonClick(String text) {
    if (userInput.contains('.') && text == '.') {
      return;
    }

    //Check if last character is an operator and the same operator is pressed again
    if (isOperator(text)) {
      if (isOperator(userInput[userInput.length - 1])) {
        if (userInput[userInput.length - 1] == text) {
          return;
        } else {
          setState(() {
            userInput = userInput.substring(0, userInput.length - 1) + text;
          });
          return;
        }
      }
    }

    if (userInput.startsWith('0')) {
      if (isOperator(text)) {
        setState(() {
          userInput = '0';
        });
      } else {
        setState(() {
          userInput = text;
        });
      }
    } else {
      setState(() {
        userInput += text;
      });
    }
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=' || x == '%') {
      return true;
    }
    return false;
  }

  // Delete button
  void deletePressed() {
    setState(() {
      if (userInput.length > 1) {
        userInput = userInput.substring(0, userInput.length - 1);
      } else {
        userInput = '0';
      }
    });
  }

  // +/- Pressed
  void plusMinusPressed() {
    setState(() {
      if (!userInput.startsWith('0') && !(userInput == '.')) {
        if (userInput[0] != '-') {
          userInput = '-' + userInput;
        } else {
          userInput = userInput.substring(1);
        }
      } else {
        userInput = '0';
      }
    });
  }

// function to calculate the input operation
  void equalPressed() {
    setState(() {
      String finaluserinput = userInput;
      finaluserinput = userInput.replaceAll('x', '*');

      Parser p = Parser();
      //handle error
      // Expression exp = p.parse(finaluserinput);
      Expression exp;
      try {
        exp = p.parse(finaluserinput);
        // Bind variables:
      } catch (e) {
        answer = 'Invalid Input';
        return;
      }
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
      // if ends with .0 remove it
      if (answer.endsWith('.0')) {
        answer = answer.substring(0, answer.length - 2);
      }
    });
  }
}
