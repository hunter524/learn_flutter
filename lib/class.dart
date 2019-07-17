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

  @override
  void initState() {
    super.initState();
//    print("class arguments initState ${ModalRoute.of(this.context).settings.arguments}}");

  }

  @override
  void deactivate() {
    super.deactivate();
    print("class arguments deactivate${ModalRoute.of(this.context).settings.arguments}}");

  }
}