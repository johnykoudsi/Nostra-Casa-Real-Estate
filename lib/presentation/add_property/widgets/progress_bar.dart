import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../../utility/app_style.dart';
import 'dart:math' as math;


class MyProgressBar extends StatelessWidget {
  final double progressValue;

  const MyProgressBar({
    super.key,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    final double progressPercent = progressValue;

    return Transform(
      transform: Matrix4.rotationY( context.locale.languageCode == 'ar' ? math.pi : 0),
      alignment: Alignment.center,
      child: FAProgressBar(
        currentValue: progressPercent,
        size: 5,
        backgroundColor: Colors.grey.shade400,
        progressColor: AppStyle.blackColor,
      ),
    );
  }
}
