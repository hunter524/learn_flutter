import 'package:flutter/material.dart';

class ContainerWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContainerWidgetsState();
  }
}

class _ContainerWidgetsState extends State<ContainerWidgets> {
  var redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar title"),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 50,
              height: 20,
              child: FlatButton(
                child: Text("flatButton"),
                onPressed: () {
                  print("flate button");
                },
              ),
            ),
          ),
          CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(Colors.white70),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            child: Text("Padding"),
            padding: EdgeInsets.all(20),
          ),
          Padding(
            child: Text("Padding"),
            padding: EdgeInsets.only(top: 50),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: 50, minWidth: double.infinity, maxHeight: 80),
            child: Container(
              height: 800,
              child: this.redBox,
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: this.redBox,
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 50, height: 50),
            child: this.redBox,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.red, Colors.orange[700]]),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(5), right: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54, blurRadius: 5, offset: Offset(2, 2))
              ],
            ),
            position: DecorationPosition.background,
            child: SizedBox(
              child: Text("DecoratedBox"),
              width: 80,
              height: 50,
            ),
          ),
          Container(
            color: Colors.black,
            child: new Transform(
              transform: Matrix4.skewY(-0.3),
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 100,
                height: 50,
                color: Colors.deepOrange,
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Text("Transform Container"),
                ),
              ),
            ),
          ),

//          Row(
//            children: <Widget>[
//              Container(
//                padding: EdgeInsets.all(10),
//                margin: EdgeInsets.all(10),
//                child: DecoratedBox(
//                  decoration: BoxDecoration(
//                    color: Colors.deepPurple,
//                  ),
//                  child: Transform.translate(
//                    offset: Offset(-20, -10),
//                    child: Text("Translate Text"),
//                  ),
//                ),
//              ),
//              Text("After Transate")
//            ],
//          ),
//          Row(
//            children: <Widget>[
//              Container(
//                padding: EdgeInsets.all(10),
//                margin: EdgeInsets.all(10),
//                child: DecoratedBox(
//                  decoration: BoxDecoration(
//                    color: Colors.deepPurple,
//                  ),
//                  child: RotatedBox(
//                    quarterTurns: 1,
//                    child: Text("Translate Text"),
//                  ),
//                ),
//              ),
//              Text("After Transate")
//            ],
//          ),

          Container(
            child: Text("5.20"),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.red, Colors.orange],
                    radius: 0.1,
                    center: Alignment.centerLeft)),
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(0.2),
            width: 100,
            height: 100,
            margin: EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}
