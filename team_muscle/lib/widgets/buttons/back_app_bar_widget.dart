import 'package:flutter/material.dart';

class BackAppBarWidget extends StatelessWidget {
  const BackAppBarWidget({super.key, required this.onTape});

  final VoidCallback onTape;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        color: Colors.grey[600],
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: onTape,
        ),
      ),
    );
  }
}
