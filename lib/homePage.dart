import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _circleBtn(String btnText) {
    return Expanded(
      child: GestureDetector(
        onTap: () => btnPressed(btnText),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          minRadius: 38.0,
          child: Text(
            "$btnText",
            style: _btnStyle(),
          ),
        ),
      ),
    );
  }

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  btnPressed(String buttonText) {
    if (buttonText == "C" || buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  // double firstNum = 0.0, secondNum = 0.0;
  // String result = "0";
  // String textToDisplay = "0";
  // String operation = "";

  // btnPressed(String btnText) {
  //   if (btnText == "C" || btnText == "AC") {
  //     firstNum = 0.0;
  //     secondNum = 0.0;
  //     result = "0";
  //     operation = "";
  //   } else if (btnText == "+" ||
  //       btnText == "-" ||
  //       btnText == "/" ||
  //       btnText == "*") {
  //     firstNum = double.parse(textToDisplay);
  //     result = "0";
  //     operation = btnText;
  //   } else if (btnText == ".") {
  //     if (result.contains(".")) {
  //       print("Already conatains a decimals");
  //       return;
  //     } else {
  //       result = result + btnText;
  //     }
  //   } else if (btnText == "=") {
  //     secondNum = double.parse(textToDisplay);
  //     if (operation == "+") {
  //       result = (firstNum + secondNum).toString();
  //     }
  //     if (operation == "-") {
  //       result = (firstNum - secondNum).toString();
  //     }
  //     if (operation == "*") {
  //       result = (firstNum * secondNum).toString();
  //     }
  //     if (operation == "/") {
  //       result = (firstNum / secondNum).toString();
  //     }
  //     firstNum = 0.0;
  //     secondNum = 0.0;
  //     operation = "";
  //   } else {
  //     result = textToDisplay + btnText;
  //   }
  //   print(result);
  //   setState(() {
  //     textToDisplay = double.parse(result).toStringAsFixed(1);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        elevation: 0.0,
        backgroundColor: Color(0XCCF4511E),
        centerTitle: true,
      ),
      body: Container(
        height: 900.0,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: Text(
                "$output",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),

            // RoundedButtons
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomCenter,
              // height: 400.0,
              child: Column(
                children: <Widget>[
                  //First Row
                  Row(
                    children: <Widget>[
                      _circleBtn("AC"),
                      _circleBtn("+/-"),
                      _circleBtn("%"),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => btnPressed("*"),
                          child: CircleAvatar(
                            backgroundColor: Color(0XCCF4511E),
                            minRadius: 38.0,
                            child: Text(
                              "C",
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // Second Row
                  Row(
                    children: <Widget>[
                      _circleBtn("7"),
                      _circleBtn("8"),
                      _circleBtn("9"),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => btnPressed("*"),
                          child: CircleAvatar(
                            backgroundColor: Color(0XCCF4511E),
                            minRadius: 38.0,
                            child: Text(
                              "x",
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // Third Row
                  Row(
                    children: <Widget>[
                      _circleBtn("4"),
                      _circleBtn("5"),
                      _circleBtn("6"),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => btnPressed("-"),
                          child: CircleAvatar(
                            backgroundColor: Color(0XCCF4511E),
                            minRadius: 38.0,
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //Fourth Row
                  Row(
                    children: <Widget>[
                      _circleBtn("1"),
                      _circleBtn("2"),
                      _circleBtn("3"),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => btnPressed("+"),
                          child: CircleAvatar(
                            backgroundColor: Color(0XCCF4511E),
                            minRadius: 38.0,
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // Fifth Row
                  Row(
                    children: <Widget>[
                      _circleBtn("0"),
                      _circleBtn("."),
                      _circleBtn("/"),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => btnPressed("="),
                          child: CircleAvatar(
                            backgroundColor: Color(0XCCF4511E),
                            minRadius: 38.0,
                            child: Text(
                              "=",
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _btnStyle() {
    return TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
}
