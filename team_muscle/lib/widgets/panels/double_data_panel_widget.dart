import "package:flutter/material.dart";

class DoubleDataPanelWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final double size;
  final Color color;
  final Color text1Color;
  final Color text2Color;
  final double textSize;

  const DoubleDataPanelWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.size = 100,
    this.color = Colors.transparent,
    this.text1Color = Colors.black,
    this.text2Color = Colors.black,
    this.textSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: size*0.5,
            child: Center(
              child: Text(
                text1,
                style: TextStyle(
                  color: text1Color,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size*0.5,
            child: Center(
              child: Text(
                text2,
                style: TextStyle(
                  color: text2Color,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}