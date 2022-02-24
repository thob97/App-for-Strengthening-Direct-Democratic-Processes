import 'package:flutter/material.dart';

class ChartModel {
  ChartModel({
    required this.label,
    required this.group,
    required this.num,
    this.color = Colors.transparent,
  });

  final String label;
  final String group;
  final int num;
  final Color color;

  //static const Color c1 = Color(0xfffb8b24);
  static const Color positive1Green = Color(0xff04A777);
  static const Color positive2Green = Color(0xff497674);
  static const Color positiveBlue = Color(0xff63A4EA);
  static const Color negativeRed = Color(0xffe05263);
  static const Color negativeBlue = Color(0xff305374);
}
