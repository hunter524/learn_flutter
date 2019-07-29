import 'package:flutter/material.dart';

//
class BarNotificationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BarNotificationState();
  }
}

class _BarNotificationState extends State<BarNotificationWidget> {
  String msg = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      height: 200,
      child: Column(
        children: <Widget>[
          NotificationListener(
            child: Builder(builder: (context) {
              return RaisedButton(
                child: Text("Pop Notification"),
                onPressed: () {
                  BarNotification("${DateTime.now().toIso8601String()}\n")
                      .dispatch(context);
                },
              );
            }),
            onNotification: (notify) {
              if (notify is BarNotification) {
                print("BarNotification");
                setState(() {
                  msg = msg + notify.msg;
                });
                return true;
              }
              return false;
            },
          ),
          Text(msg),
        ],
      ),
    );
  }
}

class BarNotification extends Notification {
  final String msg;

  BarNotification(this.msg);
}
