import 'package:flutter/material.dart';

class WrapFlow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WrapFlowState();
  }
}

class WrapFlowState extends State<WrapFlow> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Text("Wrap Flow!" * 10),
              RaisedButton(
                onPressed: () {
                  print("Press Raised Button!");
                },
                child: Text("RaisedButton" * 10),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Flow(
              delegate: FlowDelegateImpl(),
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.lightGreen),
            width: 200,
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 20,
                  left: 20,
                  width: 50,
                  height: 50,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.pink,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.lightBlue,
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlowDelegateImpl extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double h = 0;
    double w = 0;
    double gap = 20;
    for (var i = 0; i < context.childCount; i++) {
      var size = context.getChildSize(i);
      context.paintChild(i, transform: Matrix4.translationValues(0, h, 0.0));
      h = h + size.height + gap;
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return this != oldDelegate;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(200, 200);
  }
}
