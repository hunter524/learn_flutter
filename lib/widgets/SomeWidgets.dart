import 'package:flutter/material.dart';

class SomeWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "some widgets" * 6,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 18,
//                background: Paint()..color = Colors.blueAccent,
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.black),
            ),
            DefaultTextStyle(
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  color: Colors.black),
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                    text: "https://www.google.com",
                    style: TextStyle(color: Colors.blueAccent))
              ])),
            ),
//          !!!字体设置是有效的 但是需要重新启动应用!!!!
            Text(
              "https://www.google.com",
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.none,
                fontFamily: 'Bahianita',
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("RaisedButton"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(color: Colors.blueAccent, width: 2)),
                  onPressed: () {
                    print("RaisedButton Pressed");
                  },
                ),
                FlatButton(
                  child: Text("FlatButton"),
                  onPressed: () {
                    print("FlatButton Pressed");
                  },
                ),
                OutlineButton(
                  child: Text("OutlineButton"),
                  onPressed: () {
                    print("OutlineButton Pressed");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    print("IconButton Pressed");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/index.png"),
                  width: 50,
                ),
                Image(
                  image: NetworkImage(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                  width: 50,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 50,
                ),
                Image.asset(
                  "assets/index.png",
                  width: 50,
                ),
                Icon(
                  Icons.accessible,
                  color: Colors.blueAccent,
                ),
                Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: true,
                  onChanged: (change) => {},
                  tristate: true,
                ),
                Checkbox(value: false, onChanged: (change) => {}),
                Switch(value: true, onChanged: (change) => {}),
                Switch(value: false, onChanged: (change) => {}),
                Radio(value: "a", groupValue: "a", onChanged: (select) => {}),
              ],
            ),
            Slider(value: 0.5, onChanged: (v) => {}),
          ],
        ),
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
