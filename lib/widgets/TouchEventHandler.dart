import 'package:flutter/material.dart';

import 'Drags.dart';
import 'Notifications.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Touch Event"),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300, 150)),
                child: Center(
                  child: Text("Box A"),
                ),
              ),
//              behavior: HitTestBehavior.deferToChild,
              behavior: HitTestBehavior.opaque,
              onPointerDown: (downEvt) {
                print("Box A Down: ${downEvt.toString()}");
              },
            ),
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300, 200)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue)),
                  ),
                  onPointerDown: (downEvt) {
                    print("layer 1 down: ${downEvt.toString()}");
                  },
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200, 100)),
                    child: Center(
                      child: Text("非文本区域点击"),
                    ),
                  ),
                  behavior: HitTestBehavior.translucent,
                  onPointerDown: (downEvt) {
                    print("layer 2 down: ${downEvt.toString()}");
                  },
                )
              ],
            ),
            Listener(
              child: IgnorePointer( /*可以将此处更改为 Listenner IgnorePointer AbsorbPointer*/
                child: Listener(
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(color: Colors.deepPurple),
                  ),
                  onPointerDown: (downEvt){
                    print("In AbsorbPointer: ${downEvt.toString()}");
                  },
                ),
              ),
              onPointerDown: (downEvt){
                print("Out AbsorbPointer: ${downEvt.toString()}");
              },
            ),
            Drag(),
            Recognizer(),
            BarNotificationWidget(),
          ],
        ),
      ),
    );
  }
}
