import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFieldWidget extends StatelessWidget {
  const NumberFieldWidget(
      {required this.label,
        required this.hintText,
        required this.controller,
        this.titleFontSize = 20,
        this.hintFontSize = 15,
        this.isEditable = true,
        super.key});

  final String label;
  final String hintText;
  final double titleFontSize;
  final double hintFontSize;
  final bool isEditable;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: isEditable,
                  controller: controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: hintFontSize,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
