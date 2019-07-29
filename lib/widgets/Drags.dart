import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Drag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DragState();
  }
}

//与外层嵌套的SingleChildScrollView发生了冲突，因此只有先左右拖动时才可以拖动Drag
class _DragState extends State<Drag> {
  double top = 0;
  double left = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      width: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: top,
            left: left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("Drag"),
              ),
              onPanDown: (downDetail) {
                print("Drag Down ${downDetail.toString()}");
              },
              onPanUpdate: (updateDetail) {
                print("Drag Update ${updateDetail.toString()}");
                setState(() {
                  top += updateDetail.delta.dy;
                  left += updateDetail.delta.dx;
                });
              },
              onPanEnd: (endDetail) {
                print("Drag End ${endDetail.toString()}");
              },
            ),
          )
        ],
      ),
    );
  }
}

class Recognizer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RecognizerState();
  }
}

class _RecognizerState extends State<Recognizer> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        width: 300,
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "bar"),
          TextSpan(
              text: "click me",
              style: TextStyle(color: toggle ? Colors.red : Colors.grey),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    toggle = !toggle;
                  });
                }),
          TextSpan(text: "foo")
        ])));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tapGestureRecognizer.dispose();
  }
}
