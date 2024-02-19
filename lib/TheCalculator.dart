
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'TheButtonMaker.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final String initialValue = "0.0";
  String display = "0.0";
  String previouslyEvaluated = "0.0";
  bool inBracket = false;
  List<String>? holdsNumbersAndOperandInTheBracket;
  //String operationTodo = "";

  final List<String> listOfNumberAndOperand = const <String>[
    "C",
    "()",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 100,
          alignment: Alignment.centerRight,
          child: Text(
            display,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 50.0,
              color: Color(0xFF836d56),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          height: 60,
          alignment: Alignment.centerRight,
          child: Text(previouslyEvaluated,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 50.0,
                color: Colors.grey,
              )),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(children: [
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.access_time_outlined,
                  color: Color(0xFF836d56),
                ),
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.rule,
                  color: Color(0xFF836d56),
                ),
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.science_outlined,
                  color: Color(0xFF836d56),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.only(left: 200.0),
                onPressed: backSpaceDisplay,
                icon: const Icon(
                  Icons.backspace,
                  color: Color(0xFF836d56),
                ),
              ),
            ])),
        GridView.builder(
            padding: const EdgeInsets.only(top: 25.0),
            itemCount: 20,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) => Buttons(
                  textInButton: listOfNumberAndOperand.elementAt(index),
                  display: display,
                  numberAndOperandClicked: () {
                    numberAndOperandClicked(
                        listOfNumberAndOperand.elementAt(index));
                  },
                )),
      ],
    );
  }

  void backSpaceDisplay() {
    String removeLastCharacter = display.substring(0, display.length - 1);
    setState(() {
      if (removeLastCharacter.isNotEmpty) {
        display = removeLastCharacter;
      } else {
        display = initialValue;
      }
    });
  }

  double? evaluate(String x, String y, String symbol) {
    double? firstValue = double.parse(x);
    double? secondValue = double.parse(y);
    switch (symbol) {
      case "+":
        return firstValue + secondValue;
      case "-":
        return firstValue - secondValue;
      case "x":
        return firstValue * secondValue;
      case "/":
        return firstValue / secondValue;
      case "%":
        return firstValue % secondValue;
      default:
        return null;
    }
  }

  bool alrightToEvaluate() {
    return previouslyEvaluated != initialValue &&
        previouslyEvaluated.isNotEmpty;
  }

  void numberAndOperandClicked(String symbol) {
    switch (symbol) {
      case "+" || "-" || "x" || "/" || "%":
        if (alrightToEvaluate()) {
          if (!inBracket) {
            double? result = evaluate(previouslyEvaluated, display, symbol);
            if (result == null) {
              if (kDebugMode) {
                print("Wrong Operation.");
              }
            } else {
              setState(() {
                previouslyEvaluated = result.toString();
                display = initialValue;
              });
            }
          } else {
            holdsNumbersAndOperandInTheBracket?.add(display);
            setState(() {
              display = initialValue;
            });
          }
        } else {
          setState(() {
            previouslyEvaluated == initialValue
                ? previouslyEvaluated = ""
                : null;
            previouslyEvaluated = display;
            display = initialValue;
          });
        }
        break;

      case "C":
        setState(() {
          display = initialValue;
          previouslyEvaluated = initialValue;
        });

        break;

      case "()":
        if (!inBracket) {
          double? result = evaluate(previouslyEvaluated, display, "+");
          if (result == null) {
            if (kDebugMode) {
              print("Wrong Operation.");
            }
          } else {
            setState(() {
              previouslyEvaluated = result.toString();
              display = initialValue;
              //notify the user of the bracket
            });
          }
        } else {
          String resultFromBracket = calculateInBracket();
          double? overAllResult =
              evaluate(previouslyEvaluated, resultFromBracket, "+");
          setState(() {
            previouslyEvaluated = overAllResult.toString();
            display = initialValue;
          });
        }
        inBracket = !inBracket;

        break;

      case "=":
        //just display the result if the previous result is empty if not then calculate
        break;
      default:
        setState(() {
          display == initialValue ? display = "" : null;
          display += symbol;
        });
    }
  }

  String calculateInBracket() {
    int counter = 1;
    String operand = "", x = "", y = "";
    final holdsNumbersAndOperandInTheBracket =
        this.holdsNumbersAndOperandInTheBracket;
    if (holdsNumbersAndOperandInTheBracket != null) {
      while (holdsNumbersAndOperandInTheBracket.isNotEmpty) {
        if (counter == 1) {
          x = holdsNumbersAndOperandInTheBracket.removeAt(0);
        } else if (counter == 2) {
          operand = holdsNumbersAndOperandInTheBracket.removeAt(0);
        } else if (counter == 3) {
          y = holdsNumbersAndOperandInTheBracket.removeAt(0);
          counter = 1;
          double? result = evaluate(x, y, operand);
          if (result == null) {
            if (kDebugMode) {
              print("null with evaluation");
            }
          } else {
            x = result.toString();
          }
        }
        counter++;
      }
    }
    return x;
  }
}
