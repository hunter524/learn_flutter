import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LifeCycleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LifeCycleState();
  }
}

class LifeCycleState extends State<LifeCycleWidget> {
  var counter = 0;

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(children: <Widget>[
        Text(
          '$counter',
          style: TextStyle(fontSize: 20,color: Colors.blueAccent),
        ),
        FlatButton (child: Text("Increace"),
          onPressed: (){
          this.setState((){
            counter++;
          });},
        )
      ],)
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");

  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");

  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");

  }

  @override
  void didUpdateWidget(LifeCycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");

  }

  @override
  bool get mounted {
    print("mounted");
    return super.mounted;
  }


}
