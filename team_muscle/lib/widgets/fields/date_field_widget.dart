import 'package:flutter/material.dart';

class DateFieldWidget extends StatelessWidget {
  DateFieldWidget({
    required this.label,
    required this.hintText,
    required this.controller,
    this.titleFontSize = 20,
    this.hintFontSize = 15,
    this.isEditable = false,
    super.key,
  });

  String label;
  String hintText;
  TextEditingController controller;
  final double titleFontSize;
  final double hintFontSize;
  final bool isEditable;

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
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white,
                width: 2.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child : TextField(
                      enabled: isEditable,
                      controller: controller,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: hintFontSize,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      controller.text = "${picked.year}/${picked.month}/${picked.day}";
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
