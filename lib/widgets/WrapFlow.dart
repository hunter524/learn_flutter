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
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Text("Wrap Flow!" * 100),
              RaisedButton(
                onPressed: () {
                  print("Press Raised Button!");
                },
                child: Text("RaisedButton"*100),
              )
            ],
          )
        ],
      ),
    );
  }
}
