import 'package:flutter/material.dart';


class Class extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GradeState();
  }
}

class GradeState extends State<Class>{
  @override
  Widget build(BuildContext context) {

    print("class arguments ${ModalRoute.of(context).settings.arguments}}");
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 200),

        child: Center(
            child: Column(children:
            <Widget>[
              Text("I am  1 Class"),
              FlatButton(
                onPressed: (){
                  Navigator.pop(context,true);
                },
                child: Text("Go Back"),
              )
            ]
            )
        )
      ),
    );
  }
}