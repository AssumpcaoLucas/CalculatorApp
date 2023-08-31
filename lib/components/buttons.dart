import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Buttom extends StatefulWidget {
  
  final String text;
  final Color color;
  final click;
  
  Buttom({super.key, required this.text, required this.color, this.click});

  @override
  State<Buttom> createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {

  bool isPress = true;

  @override
  Widget build(BuildContext context) {
    final backgrouddcolor = const Color(0xFFE7ECEF);
    Offset distance = isPress ? Offset(4, 4) : Offset(2, 2);
    double blur = isPress ? 5.0 : 4.0;
    return 
      GestureDetector(
        onTap: widget.click,
        child: Listener(
          onPointerUp: (_) => setState(() => isPress = true),
          onPointerDown: (_) => setState(() => isPress = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
              child: Center(
                child: Text(widget.text,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                //shape: BoxShape.circle,
                color: backgrouddcolor,
                boxShadow:[
                  BoxShadow(
                    blurRadius: blur,
                    offset: -distance,
                    color: Colors.white,
                    spreadRadius: 1,
                    inset: !isPress
                  ),
        
                  BoxShadow(
                    blurRadius: blur,
                    offset: distance,
                    color: Colors.grey,
                    spreadRadius: 1,
                    inset: !isPress
                  )
        
                ]
              ),
            ),
        ),
      );
  }
}