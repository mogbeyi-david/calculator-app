import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "";

  String _output = "";
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      firstNumber = 0.0;
      secondNumber = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "*" ||
        buttonText == "-" ||
        buttonText == "/") {
      firstNumber = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output += buttonText;
      }
    } else if (buttonText == "=") {
      secondNumber = double.parse(output);
      if (operand == "+") {
        _output = (firstNumber + secondNumber).toString();
      }
      if (operand == "-") {
        _output = (firstNumber - secondNumber).toString();
      }
      if (operand == "*") {
        _output = (firstNumber * secondNumber).toString();
      }
      if (operand == "/") {
        _output = (firstNumber / secondNumber).toString();
      }

      firstNumber = 0.0;
      secondNumber = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      print(_output);
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(buttonText) {
    return Expanded(
      child: OutlineButton(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.all(24.0),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("My Calculator Application"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  output,
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                alignment: Alignment.centerRight,
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("8"),
                      buildButton("/"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("X"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("CLEAR"),
                      buildButton("="),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
