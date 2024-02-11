import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String textInButton, display;
  final void Function() numberAndOperandClicked;

  // how to change display when button clicked

  const Buttons(
      {super.key,
      required this.textInButton,
      required this.display,
      required this.numberAndOperandClicked});

  @override
  Widget build(BuildContext context) {
    Color textColor = const Color(0xFF836d56);
    Color backgroundColor = const Color(0xFFede9e6);
    switch (textInButton) {
      case "C":
        textColor = Colors.red;
        break;
      case "()" || "%" || "/" || "x" || "-" || "+":
        textColor = Colors.blueAccent;
        break;
      case "=":
        backgroundColor = const Color(0xFF4e606e);
        textColor = Colors.white;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: numberAndOperandClicked,
        child: Text(
          textInButton,
          style: TextStyle(
            color: textColor,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
