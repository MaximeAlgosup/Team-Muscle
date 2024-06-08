import "package:flutter/material.dart";

class RoundPanelWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final Color textColor;
  final double textSize;

  const RoundPanelWidget({
    super.key,
    required this.text,
    this.size = 100,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.textSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    );
  }
}