import 'dart:ffi';

import 'package:calculator/components/buttons.dart';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  final List<String> botoes = [
    "C", "DEL", "%", "/",
    "7", "8", "9", "X",
    "4", "5", "6", "-",
    "1", "2", "3", "+",
    "+/-", "0", ".", "=",
  ];
  
  String ans = "";

  void equalPressed(){
    String finalQuestion = ans;
    finalQuestion = finalQuestion.replaceAll("X", "*");
    
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    ans = eval.toString();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFFE7ECEF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(ans,
                    minFontSize: 20,
                    maxFontSize: 80,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      decoration: TextDecoration.none,
                      fontSize: 80,
                      color: Colors.grey.shade600,
                    ),
                    ),
                  )
                ],
              ),
            ),
          ),


          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFFE7ECEF),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.2
                    ),
                    itemBuilder:(context, index) {
                      if (index == 0){
                        return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Buttom(
                          click: (){
                            setState(() {
                              ans = "";
                            });
                          },
                          text: botoes[index], 
                          color: Colors.blue,
                          ),
                      );
                      }

                      else if(index == 1){
                        return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Buttom(
                          click: (){
                            setState(() {
                              ans = ans.substring(0, ans.length-1);
                            });
                          },
                          text: botoes[index], 
                          color: Colors.red,
                          ),
                      );
                      }

                      else if(index == 19){
                        return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Buttom(
                          click: (){
                            setState(() {
                              equalPressed();
                            });
                          },
                          text: botoes[index], 
                          color: Colors.green,
                          ),
                      );
                      }

                      else{
                        return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Buttom(
                          click: (){
                            setState(() {
                              ans += botoes[index];
                            });
                          },
                          text: botoes[index], 
                          color: Operador(botoes[index]) ? Colors.orange : Colors.grey.shade500,
                          ),
                      );
                      }
                      
                    },
                  ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
