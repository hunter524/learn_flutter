import 'package:flutter/material.dart';

class SomeWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "some widgets" * 6,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 18,
                background: Paint()..color = Colors.blueAccent,
                color: Colors.black),
          )
        ],
      ),
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
