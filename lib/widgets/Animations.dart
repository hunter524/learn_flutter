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
      });
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
                      )
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

  @override
  Widget build(BuildContext context) {
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
