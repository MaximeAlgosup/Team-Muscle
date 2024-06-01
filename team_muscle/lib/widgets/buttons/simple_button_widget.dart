import 'package:flutter/material.dart';

class SimpleButtonWidget extends StatelessWidget {
  const SimpleButtonWidget({
    required this.label,
    required this.onPressed,
    this.isWarning = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: isWarning ? Colors.black : Colors.white,
        backgroundColor: isWarning ? Colors.red : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(label),
    );
  }
}