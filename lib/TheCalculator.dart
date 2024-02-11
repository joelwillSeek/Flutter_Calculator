import 'package:flutter/material.dart';

import 'TheButtonMaker.dart';

class Calculator extends StatefulWidget {

  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display="";
  bool inBracket=false;

  final List<String> listOfNumberAndOperand=const <String>["C","()","%","/","7","8","9","X","4","5","6","-","1","2","3","+","+/-","0",".","="];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          padding:const EdgeInsets.all(30.0),
          height: 200,
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
        GridView.builder(
            itemCount: 20,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context,index) =>
                Buttons(
                  textInButton: listOfNumberAndOperand.elementAt(index),
                  display: display,
                  numberAndOperandClicked:(){
                    numberAndOperandClicked(index);
                  },
                )
                ),
      ],
    );
  }

  void numberAndOperandClicked (int index) {
    setState(() {
      String simbol=listOfNumberAndOperand.elementAt(index);
      if(simbol=="()"){
        if(inBracket){
          display+=")";
        }else{
          display+="(";
        }
        inBracket=!inBracket;
      }else {
        display += simbol;
      }
    });
  }
}


