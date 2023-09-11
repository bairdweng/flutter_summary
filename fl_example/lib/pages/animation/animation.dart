//@dart=2.17
import 'dart:math';

import 'package:flutter/material.dart';

import 'my_demo/voice_animation/voice_volume_animation.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => AnimationExampleState();
}

class AnimationExampleState extends State<AnimationExample>
    with TickerProviderStateMixin {
  GlobalKey<VoiceVolumeAnimationState> left = GlobalKey();
  GlobalKey<VoiceVolumeAnimationState> right = GlobalKey();
  int value = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    left.currentState?.stop();
    right.currentState?.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 100,
                height: 40,
                color: Colors.yellow,
                child: VoiceVolumeAnimation(
                    key: left, direction: VoiceVolumePainterDirection.left),
              ),
              GestureDetector(
                child: const Text("点击"),
                onTap: () {
                  value = value + 1;
                  if (value > 8) {
                    value = 0;
                  }

                  print("动画被点击---------${value}");

                  left.currentState?.reloadValue(value);
                  right.currentState?.reloadValue(value);
                },
              ),
              Container(
                color: Colors.yellow,
                width: 100,
                height: 40,
                child: VoiceVolumeAnimation(
                    key: right, direction: VoiceVolumePainterDirection.right),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final Animation<double> animation;
  LoadingPainter({required this.animation}) : super(repaint: animation);
  static const width = 30.0;

  @override
  void paint(Canvas canvas, Size size) {
    print("绘制绘制");
    final angle = animation.value * pi * 2.0;
    final paintBg = Paint()
      ..color = Colors.grey
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(
        size.width * 0.5,
        size.height * 0.5,
      ),
      size.width * 0.5,
      paintBg,
    );

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width,
        height: size.height,
      ),
      -0.5 * pi,
      angle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
