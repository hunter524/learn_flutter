import 'package:flutter/cupertino.dart';

class CupertinoUiFoo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(navigationBar: CupertinoNavigationBar(middle: Text("cupertino style"),),
      child: Center(child: CupertinoButton(child: Text("press"), onPressed: () {
        Navigator.pop(context);
      }),),);
  }

}