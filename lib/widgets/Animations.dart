import 'dart:ui' deferred as DartUi;

import 'package:flutter/material.dart';

class AnimationWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateAnimationWidgets();
  }
}

class _StateAnimationWidgets extends State<AnimationWidgets>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  AnimationController _compositeController;

  Offset touchOffset = Offset(0, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _compositeController = AnimationController(vsync: this,duration: Duration(seconds: 5));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
    _animation = Tween(begin: 0.0, end: 300.0).animate(_animation)
      ..addListener(() {
        setState(() {});
      })
      ..addListener(() {
//        print("chain call");
      }
      );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Container(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/index.png"),
                        width: _animation.value,
                        height: _animation.value,
                      ),
                      AnimatedImage(
                        animation: _animation,
                      ),
                      AnimatedBuilder(
                        animation: _animation,
                        child: Image(image: AssetImage("assets/index.png")),
                        builder: (context, child) {
                          return Container(
                            child: child,
                            width: _animation.value,
                            height: _animation.value,
                          );
                        },
                      ),
                      GradientButton(
                        child: Text("GradientButton"), width: 200, height: 50,colors: [Colors.pink[100],Colors.pink],onTap: (){
                          print("onTap GradientButton");
                      },),
                      GestureDetector(
                        onTapDown: (evt){
                          print("CustomPaint Down: ${evt.localPosition}");
                          setState(() {
                            touchOffset = Offset(evt.localPosition.dx, evt.localPosition.dy);
                          });
                        },
                        child: CustomPaint(
                          painter: MyPainter(touchOffset), size: Size(300, 300),),)

                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: CompositeAnimation(animationController: _compositeController,),
                onTap: () {
                  print("onTap");
                  _playComposite();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
    _compositeController.dispose();
  }

  _playComposite() async {
    print("_playComposite");
    try {
      await _compositeController
          .forward()
          .orCancel;
      await _compositeController
          .reverse()
          .orCancel;
    } on TickerCanceled {

    }
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    // TODO: implement build
    return Image(
      image: AssetImage("assets/index.png"),
      width: animation.value,
      height: animation.value,
    );
  }
}

class CompositeAnimation extends StatelessWidget {
  final AnimationController animationController;

  CompositeAnimation({Key key, this.animationController}) : super(key: key) {
    height = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.0, 0.6)));
    color = ColorTween(begin: Colors.green, end: Colors.red).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.0, 0.6)));
    padding = Tween(
            begin: EdgeInsets.only(left: 0.0), end: EdgeInsets.only(left: 100))
        .animate(CurvedAnimation(
            parent: animationController, curve: Interval(0.6, 1)));
  }
  Animation<double> height;
  Animation<Color> color;
  Animation<EdgeInsets> padding;
  int a =3;

  @override
  Widget build(BuildContext context) {
    var b =a is int?"int":"noint";
    // TODO: implement build
    return Container(
      alignment: Alignment.bottomLeft,
      height: 300,
      width: 300,
      padding: padding.value,
      decoration: BoxDecoration(color: Colors.deepPurple[50]),
      child: Container(
        height: height.value,
        decoration: BoxDecoration(color: color.value),
        width: 20,
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onTap,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;

  //点击回调
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          radius: 100,
          splashColor: colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//通过传入Offset绘制圆点
//结合GestureDetector组件完成对用户点击行为的检测
class MyPainter extends CustomPainter{

  Offset offset;


  MyPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint
    ..style=PaintingStyle.fill
    ..color=Colors.orange[100];
    
    canvas.drawRect(Offset.zero&size, paint);

    paint..style=PaintingStyle.stroke..color=Colors.black87..strokeWidth=1.0;
    double eH = size.height/15;
    double eW = size.width/15;

    for(var i=0;i<15;i++){
      var dy = i*eH;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for(var i=0;i<15;i++){
      var dx = eW*i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    paint..style=PaintingStyle.fill..color=Colors.grey;
    canvas.drawCircle(offset, 5, paint);
//    todo:// 绘制文字暂时没有成功
    var pb = DartUi.ParagraphBuilder(DartUi.ParagraphStyle(fontSize: 15));
    pb..addText("bar")..pushStyle(DartUi.TextStyle(color: Colors.black87));
    canvas.drawParagraph(pb.build(),Offset(10, 10));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
