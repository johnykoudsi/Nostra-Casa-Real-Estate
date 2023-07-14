import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../../utility/app_style.dart';

class MyProgressBar extends StatelessWidget {

  final double progressValue;

  MyProgressBar({

    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    final double progressPercent = progressValue;

    return FAProgressBar(
      currentValue: progressPercent,
      size: 5,
      backgroundColor: Colors.grey.shade400,
      progressColor: AppStyle.blackColor,
    );
  }
}