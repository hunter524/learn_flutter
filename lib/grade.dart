import 'package:flutter/material.dart';

/// Grade跳转class采用路由表的方式进行
///

class Grade extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GradeState();
  }
}

class GradeState extends State<Grade>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 200),

        child: Center(
            child: Column(children:
            <Widget>[
              Text("I am  1 Grade"),
              FlatButton(
                onPressed: (){
                  Navigator.pop(context,true);
                },
                child: Text("Go Back"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'class',arguments: {"type":"grade"});
                },
                child: Text("Go Class"),
              )
            ]
            )
        )
      ),
    );
  }
}