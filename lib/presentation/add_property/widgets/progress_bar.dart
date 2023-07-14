import 'package:flutter/material.dart';

class MyProgressBar extends StatelessWidget {
  final int totalSegments;
  final int currentSegment;

  MyProgressBar({
    required this.totalSegments,
    required this.currentSegment,
  });

  @override
  Widget build(BuildContext context) {
    final double progressPercent = (currentSegment / totalSegments).clamp(0, 1).toDouble();

    return LinearProgressIndicator(
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      value: progressPercent,
    );
  }
}