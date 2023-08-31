import 'package:calculator/screans/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

bool Operador(String x){
    if (x == "%" || x == "/" || x == "-" || x == "+" || x == "=" || x == "X"){
      return true;
    }
    return false; 
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator()
    );
  }
}

 
