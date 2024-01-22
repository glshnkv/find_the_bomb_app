import 'package:flutter/material.dart';

class StrokeTextWidget extends StatelessWidget {
  final String text;
  final Color strokeColor;
  final double fontSize;

  const StrokeTextWidget(
      {super.key, required this.text, required this.strokeColor, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = strokeColor,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
