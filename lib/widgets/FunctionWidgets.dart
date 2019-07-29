import 'package:flutter/material.dart';

class FunctionWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateFunctionWidgets();
  }
}

class _StateFunctionWidgets extends State<FunctionWidgets> {
  DateTime _lastClick;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var mainTheme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (_lastClick == null ||
            DateTime.now().difference(_lastClick) > Duration(seconds: 1)) {
          setState(() {
            _lastClick = DateTime.now();
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                Text(
                    _lastClick != null ? _lastClick.toIso8601String() : "null"),
                ShareDataWidget(
                  child: InnerWidgets(),
                  data: count,
                ),
                RaisedButton(
                  child: Text("IncreaceMent"),
                  onPressed: () {
                    setState(() {
                      ++count;
                    });
                  },
                ),
                Theme(
                  data:
                      ThemeData(iconTheme: IconThemeData(color: Colors.blue)),
                  child: Row(
                    children: <Widget>[Icon(Icons.add), Text("Text")],
                  ),
                ),
                Row(
                  children: <Widget>[Icon(Icons.add), Text("Text")],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  final int data;

  ShareDataWidget({@required this.data, child: Widget}) : super(child: child) {}

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return this.data != oldWidget.data;
  }

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }
}

class InnerWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateInnerWidgets();
  }
}

class _StateInnerWidgets extends State<InnerWidgets> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("InnerWidgetDidChange");
  }
}
