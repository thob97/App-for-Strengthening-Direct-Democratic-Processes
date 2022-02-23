import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    required this.placeholder,
    required this.controller,
    required this.maxLines,
    this.suffixIcon,
  });

  final String placeholder;
  final TextEditingController controller;
  final int maxLines;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: placeholder,
          //fillColor: Colors.white,
          //filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
