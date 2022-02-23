import 'package:flutter/material.dart';

class InputTextHeading extends StatelessWidget {
  const InputTextHeading({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        padding: const EdgeInsets.only(right: 10, top: 10),
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 2.0),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
