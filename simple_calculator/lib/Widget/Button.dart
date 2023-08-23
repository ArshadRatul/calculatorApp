import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final double textSize;
  final Function callback;
  final double height;
  const CalculatorButton({super.key,  required this.text, required this.fillColor, required this.textSize, required this.callback, required this.height,  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          width: 90,
          height: height,
          child:
          TextButton(
            onPressed: () {
              callback(text);
              print(text);
            },
            style: TextButton.styleFrom(
              backgroundColor: fillColor,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // Button border radius
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: textSize, // Text size
                fontWeight: FontWeight.bold, // Text font weight
                color: Colors.white, // Text color
              ),
            ),
          )
      ),
    );
  }
}

