//@dart=2.17
import 'package:flutter/material.dart';

enum VoiceVolumePainterDirection { left, right }

class VoiceVolumeAnimation extends StatefulWidget {
  // 方向，相左边递增，向右边递增
  final VoiceVolumePainterDirection direction;
  // 柱型数量
  final int barCount;
  // 柱形宽度
  final double barWidth;
  // 高度变化的值,递增或者递减
  final int heightChangeValue;
  // 默认的颜色
  final Color normalColor;
  // 激活颜色
  final Color activeColor;
  // 圆角
  final double cornerValue;
  const VoiceVolumeAnimation({
    Key? key,
    this.direction = VoiceVolumePainterDirection.left,
    this.heightChangeValue = 2,
    this.barCount = 8,
    this.barWidth = 4,
    this.cornerValue = 4,
    this.normalColor = Colors.grey,
    this.activeColor = Colors.blue,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => VoiceVolumeAnimationState();
}

class VoiceVolumeAnimationState extends State<VoiceVolumeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;
  final double currentVolume = 1.0;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: VoiceVolumePainter(
            animation: _animation,
            direction: widget.direction,
            heightChangeValue: widget.heightChangeValue,
            barCount: widget.barCount,
            barWidth: widget.barWidth,
            cornerValue: widget.cornerValue,
            normalColor: widget.normalColor,
            activeColor: widget.activeColor));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _tween = Tween<double>(begin: 0, end: widget.barCount.toDouble());
    _animation = _tween.animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
  }

  void reloadValue(int value) {
    _controller.reset();
    _tween.begin = value.toDouble();
    _tween.end = value.toDouble() + 2.0;
    _controller.forward();
  }

  void stop() {
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }
}

class VoiceVolumePainter extends CustomPainter {
  final Animation<double> animation;
  final VoiceVolumePainterDirection direction;
  final int barCount;
  final double barWidth;
  final int heightChangeValue;
  final Color normalColor;
  final Color activeColor;
  final double cornerValue;
  VoiceVolumePainter({
    required this.animation,
    this.direction = VoiceVolumePainterDirection.left,
    this.heightChangeValue = 2,
    this.barCount = 8,
    this.barWidth = 4,
    this.cornerValue = 4,
    this.normalColor = Colors.grey,
    this.activeColor = Colors.blue,
  }) : super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size) {
    // 间隔
    var interval = ((size.width - (barWidth * barCount))) / (barCount - 1);
    // 递减
    var decrease = heightChangeValue;
    // 开始的点
    var startPointX = 0.0;
    // 高度
    var barHeight = 0.0;
    var flagIndex = animation.value.toInt();
    if (flagIndex < 0) {
      flagIndex = 0;
    }
    if (flagIndex > barCount) {
      flagIndex = barCount;
    }
    barHeight = size.height - decrease * (barCount - 1);
    if (direction == VoiceVolumePainterDirection.left) {
      startPointX = size.width - barWidth / 2;
    } else {
      startPointX = barWidth / 2;
    }
    final bgPaint = Paint()
      ..color = normalColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    final bluePaint = Paint()
      ..color = activeColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    for (var i = 0; i < barCount; i++) {
      canvas.drawRRect(
          RRect.fromRectAndCorners(
              Rect.fromCenter(
                  center: Offset(startPointX, size.height / 2),
                  width: barWidth,
                  height: barHeight),
              topLeft: Radius.circular(cornerValue),
              topRight: Radius.circular(cornerValue),
              bottomLeft: Radius.circular(cornerValue),
              bottomRight: Radius.circular(cornerValue)),
          i < flagIndex ? bluePaint : bgPaint);

      if (direction == VoiceVolumePainterDirection.left) {
        barHeight = barHeight + decrease;
        startPointX = startPointX - (interval + barWidth);
      } else {
        barHeight = barHeight + decrease;
        startPointX = startPointX + (interval + barWidth);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
