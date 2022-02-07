import 'package:flutter/material.dart';

class ChartModel {
  ChartModel({
    required this.partyName,
    required this.label,
    required this.votes,
    required this.color,
  });

  final String partyName;

  //For or against
  final String label;
  final int votes;
  final Color color;
}

class DashboardModel {
  DashboardModel({required this.month, required this.num});

  final int month;
  final int num;
}
