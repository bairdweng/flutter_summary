//@dart=2.17
import 'package:flutter/material.dart';

class ZoomAnimation extends StatefulWidget {
  const ZoomAnimation({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => ZoomAnimationState();
}

class ZoomAnimationState extends State<ZoomAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _borderW;

  final double currentVolume = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: Colors.yellow,
                width: _borderW.value,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          );
        },
      ),
      onTap: () {
        _controller.forward();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _borderW = Tween<double>(begin: 0, end: 10).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.6, 0.8))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          }));
    _controller.forward();
  }
}
