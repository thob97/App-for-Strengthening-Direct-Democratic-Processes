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
}
