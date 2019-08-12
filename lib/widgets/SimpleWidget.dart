import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return ErrorWidget("Flutter Analysis");
    return BarLeafRenderObjectWidget();
  }
}

//实现自己绘制一条线的操作
// 并且动态的进行循环增长操作
class BarLeafRenderObjectWidget extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return BarRenderObject(45);
  }
}

//自定义RenderObject 绘制一条全屏的对角线
class BarRenderObject extends RenderBox {

  int degree = 0;

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void scheduleInitialLayout() {
    // TODO: implement scheduleInitialLayout
    super.scheduleInitialLayout();
  }
  @override
  void performResize() {
    super.performResize();
  }
  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
    super.paint(context, offset);
    var paint = Paint();
    paint
      ..isAntiAlias = true
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    context.canvas.save();
    context.canvas.drawLine(Offset(10,10), Offset(10, degree.toDouble()), paint);
    context.canvas.restore();
  }

  BarRenderObject(this.degree){
    print("scheduleInitialLayout");
    Timer.periodic(Duration(milliseconds: 30), (tm){
      degree = (++degree)%360;
      markNeedsPaint();
    });
  }
}
