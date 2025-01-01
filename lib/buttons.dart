import 'package:flutter/material.dart';

class CalcButtons extends StatelessWidget {
  final color;
  final textColor;
  double textFontSize = 22;
  final String buttonText;
  final buttonPressed;
  dynamic applyShadow = Shadow(blurRadius: 15.0, color: Colors.black, offset: Offset(2.0, 2.0),);
  static dynamic buttonsRadius = BorderRadius.circular(20);
  static dynamic buttonPadding = EdgeInsets.all(5);

  CalcButtons(
      {this.color,
      this.textColor,
      required this.buttonText,
      this.buttonPressed,
      required this.textFontSize,
      required this.applyShadow,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: buttonPressed,
      child: Padding(
        padding: buttonPadding,
        child: ClipRRect(
          borderRadius: buttonsRadius, //all
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: textFontSize,
                  fontWeight: FontWeight.w500,
                  shadows: [applyShadow],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
