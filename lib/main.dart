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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[500],
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            color: Colors.white,
            child: Center(
              child: Text(
                calc,
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getRow3()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getRow2(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getRow1(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50.0,
                child: FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '${calc}0';
                    });
                  },
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
                child: FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '$calc.';
                    });
                  },
                  child: Text(
                    '.',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
                child: FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '$calc^';
                    });
                  },
                  child: Text(
                    '^',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              SizedBox(
                child: FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '$calc*10^';
                    });
                  },
                  child: Text(
                    '×10^',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              FlatButton(
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
                  '=',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50.0,
                child: FlatButton(
                    color: Colors.grey[600],
                    onPressed: () {
                      setState(() {
                        calc = '$calc(';
                      });
                    },
                    child: Text(
                      '(',
                      style: TextStyle(fontSize: 30.0),
                    )),
              ),
              SizedBox(
                width: 50.0,
                child: FlatButton(
                    color: Colors.grey[600],
                    onPressed: () {
                      setState(() {
                        calc = '$calc)';
                      });
                    },
                    child: Text(
                      ')',
                      style: TextStyle(fontSize: 30.0),
                    )),
              ),
              SizedBox(
                width: 50.0,
                child: FlatButton(
                    color: Colors.grey[600],
                    onPressed: () {
                      setState(() {
                        calc = '${calc}e';
                      });
                    },
                    child: Text(
                      'e',
                      style: TextStyle(fontSize: 30.0),
                    )),
              ),
              FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '${calc}sin(';
                    });
                  },
                  child: Text(
                    'sin',
                    style: TextStyle(fontSize: 30.0),
                  )),
              FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '${calc}cos(';
                    });
                  },
                  child: Text(
                    'cos',
                    style: TextStyle(fontSize: 30.0),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 60.0,
                child: FlatButton(
                    color: Colors.grey[600],
                    onPressed: () {
                      setState(() {
                        calc = '${calc}ln(';
                      });
                    },
                    child: Text(
                      'ln',
                      style: TextStyle(fontSize: 30.0),
                    )),
              ),
              FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '${calc}log(';
                    });
                  },
                  child: Text(
                    'log',
                    style: TextStyle(fontSize: 30.0),
                  )),
              FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '${calc}cot(';
                    });
                  },
                  child: Text(
                    'cot',
                    style: TextStyle(fontSize: 30.0),
                  )),
              FlatButton(
                  color: Colors.grey[600],
                  onPressed: () {
                    setState(() {
                      calc = '${calc}sqrt(';
                    });
                  },
                  child: Text(
                    'sqrt',
                    style: TextStyle(fontSize: 30.0),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getRow1() {
    List<Widget> temp = [];
    for (int i = 1; i <= 3; i++) {
      temp.add(SizedBox(
        width: 50.0,
        child: FlatButton(
          color: Colors.grey[600],
          onPressed: () {
            setState(() {
              calc = '$calc$i';
            });
          },
          child: Text(
            '$i',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ));
    }
    temp.addAll([
      FlatButton(
        color: Colors.grey[600],
        onPressed: () {
          setState(() {
            calc = '$calc+';
          });
        },
        child: Text(
          '+',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      FlatButton(
        color: Colors.grey[600],
        onPressed: () {
          setState(() {
            calc = '$calc-';
          });
        },
        child: Text(
          '-',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    ]);
    return temp;
  }

  List<Widget> getRow2() {
    List<Widget> temp = [];
    for (int i = 4; i <= 6; i++) {
      temp.add(SizedBox(
        width: 50.0,
        child: FlatButton(
          color: Colors.grey[600],
          onPressed: () {
            setState(() {
              calc = '$calc$i';
            });
          },
          child: Text(
            '$i',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ));
    }
    temp.addAll([
      FlatButton(
        color: Colors.grey[600],
        onPressed: () {
          setState(() {
            calc = '$calc*';
          });
        },
        child: Text(
          '×',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      FlatButton(
        color: Colors.grey[600],
        onPressed: () {
          setState(() {
            calc = '$calc/';
          });
        },
        child: Text(
          '÷',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    ]);
    return temp;
  }

  List<Widget> getRow3() {
    List<Widget> temp = [];
    for (int i = 7; i <= 9; i++) {
      temp.add(SizedBox(
        width: 50.0,
        child: FlatButton(
          color: Colors.grey[600],
          onPressed: () {
            setState(() {
              calc = '$calc$i';
            });
          },
          child: Text(
            '$i',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ));
    }
    temp.addAll([
      FlatButton(
        onPressed: () {
          setState(() {
            calc = calc.substring(0, calc.length - 1);
          });
        },
        child: Icon(Icons.backspace),
        color: Colors.grey[600],
      ),
      FlatButton(
        color: Colors.grey[600],
        onPressed: () {
          setState(() {
            calc = '';
          });
        },
        child: Text(
          'AC',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    ]);
    return temp;
  }
}
