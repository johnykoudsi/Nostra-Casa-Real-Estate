import 'package:flutter/material.dart';

class MyProgressBar extends StatefulWidget {
  final int totalSegments;
  final int currentSegment;

  MyProgressBar({required this.totalSegments, required this.currentSegment});

  @override
  _MyProgressBarState createState() => _MyProgressBarState();
}

class _MyProgressBarState extends State<MyProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: widget.currentSegment.toDouble())
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(MyProgressBar oldWidget) {
    _animation = Tween<double>(
            begin: oldWidget.currentSegment.toDouble(),
            end: widget.currentSegment.toDouble())
        .animate(_animationController);
    _animationController.reset();
    _animationController.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width ;
    const double spaceWidth = 2;
    final double segmentWidth = totalWidth / widget.totalSegments ;
    final double blackSegmentWidth = segmentWidth - (spaceWidth*2);


    return Stack(
      children: [
        Row(
          children: List.generate(
            widget.totalSegments,
            (index) => Flexible(
              child: Container(
                height: 10,
                width: segmentWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
                margin: EdgeInsets.symmetric(horizontal: spaceWidth),
              ),
            ),
          ),
        ),
        Row(
          children: List.generate(
            widget.currentSegment,
                (index) => Flexible(
              child: Container(
                height: 10,
                width: blackSegmentWidth,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
                margin: EdgeInsets.symmetric(horizontal: spaceWidth),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
