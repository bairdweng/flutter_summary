//@dart=2.17
import 'dart:math';

import 'package:flutter/material.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => AnimationExampleState();
}

class AnimationExampleState extends State<AnimationExample>
    with TickerProviderStateMixin {
  GlobalKey<VoiceVolumeAnimationBarState> animationG = GlobalKey();
  late AnimationController _controllerX;
  late Animation<double> _turns;

  @override
  void initState() {
    _controllerX = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
    _turns = Tween(begin: 0.0, end: pi * 2).animate(
      CurvedAnimation(parent: _controllerX, curve: Curves.easeIn),
    );
    _controllerX.forward()..whenComplete(() => _controllerX.reverse());

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerX.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text("点击"),
              onTap: () {
                animationG.currentState
                    ?.setCurrentValume(Random().nextDouble());
              },
            ),
            // ignore: avoid_unnecessary_containers
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.yellow,
                  width: 100,
                  height: 40,
                  child: IMVoiceVolumeAnimationBar(key: animationG),
                )
              ],
            ),
            CustomPaint(
              size: Size(100, 40),
              painter: MyPainter(_controllerX),
            ),
          ],
        ),
      ),
    );
  }
}

class IMVoiceVolumeAnimationBar extends StatefulWidget {
  const IMVoiceVolumeAnimationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VoiceVolumeAnimationBarState();
  }
}

class VoiceVolumeAnimationBarState extends State<IMVoiceVolumeAnimationBar> {
  double currentValumeValue = 0.0;
  @override
  Widget build(BuildContext context) {
    // 个数
    var itemCount = 8;
    var height = 20.0;

    double flag = currentValumeValue * itemCount;
    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(createItem(height, i < flag));
      height = height + 3;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  void setCurrentValume(double value) {
    setState(() {
      currentValumeValue = value;
    });
  }

  Widget createItem(double height, bool isLight) {
    return SizedBox(
      width: 5,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(color: isLight ? Colors.blue : Colors.grey),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Animation<double> repaintX;
  const MyPainter(this.repaintX);
  // 波长
  final double waveWidth = 80;
  // 振幅
  final double waveHeight = 40;

  @override
  void paint(Canvas canvas, Size size) {
    // print("repaintX====${repaintX.value}");
    // // 创建画笔
    // final Paint paintLine = Paint()
    //   ..color = Colors.black
    //   ..strokeWidth = 3;
    // // 绘制线
    // canvas.drawLine(Offset(-100, 0), Offset(100, 0), paintLine);
    // canvas.drawLine(Offset(0, 100), Offset(0, -100), paintLine);
    // // 创建画笔
    // final Paint paintPoint = Paint()..color = Colors.red;
    // // 绘制圆点
    // canvas.drawCircle(Offset(0, 0), 10, paintPoint);
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill // 这里改为填充模式，不再是线条
      ..strokeWidth = 2;
    // 画布移动屏幕中央
    canvas.translate(200 / 2, 200 / 2);
    // 画布保存状态
    canvas.save();
    // 根据进度修改画布x轴的位置，然后不断重绘进行动效的实现
    canvas.translate(2 * waveWidth * repaintX.value, 0);
    // 保存画布状态
    Path path = Path();
    // 第一组波浪
    path.relativeQuadraticBezierTo(
        waveWidth / 2, -waveHeight * 2, waveWidth, 0);
    path.relativeQuadraticBezierTo(waveWidth / 2, waveHeight * 2, waveWidth, 0);
    // 第二组波浪
    path.relativeQuadraticBezierTo(
        waveWidth / 2, -waveHeight * 2, waveWidth, 0);
    path.relativeQuadraticBezierTo(waveWidth / 2, waveHeight * 2, waveWidth, 0);
    // 当前结束点（x,y）与（x+0,y+60）进行连接
    path.relativeLineTo(0, 60);
    // 当前结束点（x,y）与（x-80*2*2,y）进行连接
    path.relativeLineTo(-waveWidth * 2 * 2.0, 0);
    // 路径关闭
    path.close();
    // 绘制
    canvas.drawPath(path, paint);
    // 恢复画布
    canvas.restore();
    // 矩形边框
    Path pathRect = Path();
    pathRect.addRect(Rect.fromLTWH(160, -140, 160, 200));
    // 设置矩形边框画笔
    Paint paintCircle = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    // 绘制矩形
    canvas.drawPath(pathRect, paintCircle);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => oldDelegate.repaintX != repaintX;
}
