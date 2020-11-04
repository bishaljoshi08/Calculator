import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Calculator'),
          centerTitle: true,
          backgroundColor: Colors.grey[400],
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String calc = '';
  List<String> symbols = [
    '7',
    '8',
    '9',
    '<-',
    'AC',
    '4',
    '5',
    '6',
    '*',
    '/',
    '1',
    '2',
    '3',
    '+',
    '-',
    '0',
    '.',
    'E',
    '^',
    'sqrt',
    '(',
    ')',
    'sin',
    'cos',
    'tan',
    'e',
    'ln',
    'log',
    'pi',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[500],
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.white,
                    child: Text(
                      calc,
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Wrap(
              spacing: 1.0,
              children: buttons(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buttons() {
    List<Widget> temp = [];
    for (String symbol in symbols) {
      if (symbol == '<-') {
        temp.add(SizedBox(
          width: 69.0,
          child: FlatButton(
            color: Colors.grey[600],
            onPressed: () {
              setState(() {
                calc = calc.substring(0, calc.length - 1);
              });
            },
            child: Icon(Icons.backspace),
          ),
        ));
      } else if (symbol == 'AC') {
        temp.add(SizedBox(
          width: 69.0,
          child: FlatButton(
            color: Colors.grey[600],
            onPressed: () {
              setState(() {
                calc = '';
              });
            },
            child: Text(
              'AC',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ));
      } else if (symbol == 'E') {
        temp.add(SizedBox(
          width: 69.0,
          child: FlatButton(
            color: Colors.grey[600],
            onPressed: () {
              setState(() {
                calc = '$calc*10^';
              });
            },
            child: Text(
              '$symbol',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ));
      } else if (symbol == '=') {
        temp.add(SizedBox(
          width: 69.0,
          child: FlatButton(
            color: Colors.grey[600],
            onPressed: () {
              setState(() {
                try {
                  calc = calc.interpret().toString();
                } catch (e) {
                  calc = 'Error in Expression';
                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      calc = '';
                    });
                  });
                }
              });
            },
            child: Text(
              '$symbol',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ));
      } else {
        temp.add(SizedBox(
          width: 69.0,
          child: FlatButton(
            color: Colors.grey[600],
            onPressed: () {
              setState(() {
                calc = '$calc$symbol';
              });
            },
            child: Text(
              '$symbol',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ));
      }
    }
    return temp;
  }
}
