import 'package:flutter/material.dart';

import 'TheButtonMaker.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});
  //stoped here
  final List<String> listOfNumberAndOperand=const <String>["C","()","%","/","7","8","9","X","4","5","6","-","1","2","3","+","+/-","0",".","="];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          padding:const EdgeInsets.all(30.0),
          child: const TextField(
            decoration: InputDecoration.collapsed(hintText: "Enter Number"),
          ),
        ),
        GridView.builder(
            itemCount: 20,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context,index) =>  Buttons(textInButton: listOfNumberAndOperand.elementAt(index))
        )
      ],
    );
  }
}


