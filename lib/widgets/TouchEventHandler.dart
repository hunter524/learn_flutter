import 'package:flutter/material.dart';

class TouchEventHandler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TouchEventState();
  }
}

class TouchEventState extends State<TouchEventHandler> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[Text("Touch Event")],
      ),
    );
  }
}
